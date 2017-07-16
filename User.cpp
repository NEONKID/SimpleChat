//
// Created by neonkid on 5/25/17.
//

#include <arpa/inet.h>
#include <sstream>
#include <unistd.h>

#include "User.h"
#include "App.h"

const int User::MAXSTRLEN = 255;

User::User(int cs, int send_s, int room_s, sockaddr_in ca) : client_socket(cs), userList_sock(send_s), client_address(ca), roomList_sock(room_s),
                                                             id(new char()), roomName(new char()) {}

User::~User()
{
    closeSession();
}

int User::getSocket() const
{
    return this->client_socket;
}

char* User::getIP() const
{
    static char *address = inet_ntoa(this->client_address.sin_addr);
    return address;
}

int User::getPort() const
{
    return ntohs(this->client_address.sin_port);
}

const char* User::getId() const
{
    return this->id;
}

void User::setId(char *buf) const
{
    int len = 0;
    len = strnlen(buf, Auth::MAXSTRID);

    strncpy(this->id, buf, len);
    id[len] = 0;
}

void User::closeSession()
{
    close(this->client_socket);
    close(this->userList_sock);
    close(this->roomList_sock);
}

[[Override]]
int User::run()
{
    char buf[User::MAXSTRLEN];
    memset(buf, 0, sizeof(buf));

    char buf_id[Auth::MAXSTRID];
    memset(buf_id, 0, sizeof(buf_id));

    while(true)
    {
        try
        {
            recvMessage(buf, buf_id);
            if(strncmp(buf_id, "", sizeof(buf_id)) == 0)    // ID가 기재 안되어 있으면,
            {
                stringstream oss;
                oss << getId() << ": " << buf;
                sendMessageAll(oss.str().c_str());  // 모든 사용자에게 전달,,
            }
            else
            {
                stringstream oss;
                oss << ">>>>> " << getId() << " >>>>> " << buf_id  << ": " << buf;
                sendMessageSec(oss.str().c_str(), buf_id);
            }
            cout << "(" << getIP() << ":" << getPort() << ") : " << buf << "--> "
                 << getRoomName() << endl;
        }
        catch(ChatException ex)
        {
            stringstream oss;
            oss << getId() << "님이 나갔습니다. " << endl;
            sendMessageAll(oss.str().c_str());  // Broadcasting....
            printLeaveUser(*this);
            break;  // 사용자가 나간 신호를 받았으면, 루프 중지....
        }
    }
    eraseUser();
    delete this;    // 스레드 종료,,
    return 0;
}

void User::recvMessage(char *buf, char *id)
{
    Message msg;
    int len = 0;
    memset(&msg, 0, sizeof(Message));

    if(recv(this->client_socket, (char*)&msg, sizeof(Message), 0) <= 0)
    {
        throw ChatException(SESSION_ERROR);
    }
    len = strnlen(msg.data, User::MAXSTRLEN);
    strncpy(buf, msg.data, strnlen(msg.data, User::MAXSTRLEN));
    buf[len] = 0;

    len = strnlen(msg.id, Auth::MAXSTRID);
    strncpy(id, msg.id, strnlen(msg.id, Auth::MAXSTRID));
    id[len] = 0;
}

void User::sendMessageAll(const char *buf)
{
    int len = App::userList.size();
    for(int i = 0; i < len; i++)
    {
        User *user = App::userList.at(i);
        if(strncmp(this->getRoomName(), user->getRoomName(), 3) == 0)
        {
            try
            {
                sendMessage(user->getSocket(), buf);
            }
            catch(ChatException ex)
            {
                throw ChatException(SEND_ERROR);
            }
        }
    }
}

void User::sendMessage(int socket, const char *buf)
{
    Message msg;
    memset(&msg, 0, sizeof(Message));

    if(buf != nullptr)
    {
        int len = strnlen(buf, User::MAXSTRLEN);
        strncpy(msg.data, buf, len);
        msg.data[len] = 0;
    }

    pthread_mutex_lock(&App::pMutex);
    if(send(socket, (const char*)&msg, sizeof(Message), 0) <= 0)
    {
        pthread_mutex_unlock(&App::pMutex);
        throw ChatException(SESSION_ERROR);
    }
    pthread_mutex_unlock(&App::pMutex);
}

void User::sendMessageSec(const char* buf, const char* id)
{
    int len = App::userList.size();
    for(int i = 0; i < len; i++)
    {
        User *user = App::userList.at(i);
        if(strncmp(id, user->getId(), 3) == 0)
        {
            try
            {
                sendMessage(user->getSocket(), buf);
                sendMessage(this->getSocket(), buf);
            }
            catch(ChatException ex)
            {
                throw ChatException(SEND_ERROR);
            }
            break;
        }
    }
}

void User::printLeaveUser(const User &user) const
{
    cout << "사용자가 나갔습니다 (" << user.getIP() << ": " << user.getPort() << "), " << user.getId() << endl;
}

void User::setRoomName(char *buf) const
{
    int len = 0;
    len = strnlen(buf, 3);

    strncpy(this->roomName, buf, len);
    roomName[len] = 0;
}

const char* User::getRoomName() const
{
    return roomName;
}

void User::eraseUserSent(void)
{
    int len = App::userList.size();

    pthread_mutex_lock(&App::pMutex);
    for(int i = 0; i < len; i++)
    {
        User *user = App::userList.at(i);
        if(strncmp(this->getId(), user->getId(), Auth::MAXSTRID) != 0)
        {
            try
            {
                sendUserID(user->getrecvIDSocket(), this->getId());
            }
            catch(ChatException ex)
            {
                throw ChatException(SEND_ERROR);
            }
        }
    }
    pthread_mutex_unlock(&App::pMutex);

    pthread_mutex_lock(&App::pMutex);
    for(int i = 0; i < len; i++)
    {
        User *user = App::userList.at(i);
        if(user->getSocket() == this->getSocket())
        {
            App::userList.erase(App::userList.begin() + i); // 사용자 리스트에서 끊어진 사용자 제거,,
            break;
        }
    }
    pthread_mutex_unlock(&App::pMutex);
}

void User::eraseUser()
{
    int len = App::userList.size();
    pthread_mutex_lock(&App::pMutex);
    for(int i = 0; i < len; i++)
    {
        User *user = App::userList.at(i);
        if(user->getSocket() == this->getSocket())
        {
            App::userList.erase(App::userList.begin() + i); // 사용자 리스트에서 끊어진 사용자 제거,,
            break;
        }
    }
    pthread_mutex_unlock(&App::pMutex);
}

void User::sendUserList()
{
    int len = App::userList.size();
    for(int i = 0; i < len; i++)
    {
        User *user = App::userList.at(i);
        if(strncmp(user->getRoomName(), this->getRoomName(), 3) == 0)
        {
            try
            {
                sendUserID(user->getrecvIDSocket(), this->getId());
                if(strncmp(user->getId(), this->getId(), Auth::MAXSTRID) != 0)
                {
                    sendUserID(this->getrecvIDSocket(), user->getId()); // 최초 로그인 사용자 모든 리스트 전송..
                }
            }
            catch(ChatException ex)
            {
                throw ChatException(SEND_ERROR);
            }
        }
    }
}

void User::sendUserID(int socket, const char *buf)
{
    char buf_w[Auth::MAXSTRID];

    if(buf != nullptr)
    {
        strncpy(buf_w, buf, Auth::MAXSTRID);
        int len = strnlen(buf_w, Auth::MAXSTRID);
        buf_w[len] = 0;
    }

    pthread_mutex_lock(&App::pMutex);
    if(send(socket, buf_w, sizeof(buf_w), 0) <= 0)
    {
        pthread_mutex_unlock(&App::pMutex);
        throw ChatException(SEND_ERROR);
    }
    pthread_mutex_unlock(&App::pMutex);
}

int User::getrecvIDSocket() const
{
    return this->userList_sock;
}

int User::getRoomSocket() const
{
    return this->roomList_sock;
}