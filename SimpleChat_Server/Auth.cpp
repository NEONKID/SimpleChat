//
// Created by neonkid on 5/28/17.
//

#include "Auth.h"

const char Auth::login_Success[7] = "0x0011";
const char Auth::login_Fail[7] = "0x0010";
int roomNum = 0;

Auth::Auth(User *user) : inUser(user) {}

void Auth::printNewUser(const User *user) const
{
    cout << "새로운 사용자가 인증 됨 ! " << user->getIP() << ", " << user->getPort() << ")" << endl;
}

void Auth::printExceedUser(const User *user) const
{
    cout << "새로운 사용자가 인증에 실패함 !" << user->getIP() << ", " << user->getPort() << ")" << endl;
}

void Auth::getloginInfo(char *outputID)
{
    char tmpID[16];
    memset(&tmpID, 0, sizeof(tmpID));

    loginFile.open("simple_chat_Login.txt");

    if(!loginFile)
    {
        throw AuthException(FILE_NOT_FOUND);
    }

    while(!loginFile.eof() && outputID[0] != NULL)
    {
        loginFile.getline(tmpID, sizeof(tmpID));

        if(strncmp(outputID, tmpID, strlen(outputID)) == 0)
        {
            loginFile.close();  // 파일은 더 이상 필요 없으므로 닫음..
            for(int i = 0; i < App::userList.size(); i++)
            {
                User *user = App::userList.at(i);
                if(strncmp(user->getId(), outputID, sizeof(outputID)) == 0)
                {
                    loginFile.close();
                    throw AuthException(CONNECTED_ID);
                }
            }
            return;
        }
    }
    loginFile.close();
    throw AuthException(ID_NOT_FOUND);
}

[[Override]]
int Auth::run()
{
    char bufID[MAXSTRID];
    char roomID[3];

    while(true)
    {
        memset(&bufID, 0, MAXSTRID);
        memset(&roomID, 0, 3);
        try
        {
            recvID(bufID);
            getloginInfo(bufID);
            inUser->setId(bufID);   // 사용자 ID 기록...
            sendInfo(login_Success);

            pthread_mutex_lock(&App::pMutex);
            App::userList.push_back(inUser);  // 해당 사용자를 로비 userList에 추가합니다.
            pthread_mutex_unlock(&App::pMutex);
            printNewUser(inUser);

            cout << "(" << inUser->getIP() << ":" << inUser->getPort() << ") : " << "새로운 사용자가 "
                 << inUser->getId() << "로 접속하였습니다.  " << endl;

            // 방 리스트를 사용자에게 넘겨주고, 원하는 방을 선택하도록 함.
            recvRoomNum(roomID);
            inUser->sendUserList(); // 유저 리스트를 기존 접속자에게 전송

            stringstream oss;
            oss << inUser->getId() << " 님이 접속하였습니다.  " << endl;
            inUser->sendMessageAll(oss.str().c_str());
            inUser->start();  // 이제 채팅방에 들어갑니다.
            break;
        }
        catch(ChatException ex)
        {
            cout << "(" << inUser->getIP() << ":" << inUser->getPort() << ") : " << "인증 쓰레드 오류 발생 !" << endl;
            inUser->eraseUser();
            break;
        }
        catch(AuthException ex)
        {
            ex.printError();
            printExceedUser(inUser);
            sendInfo(login_Fail);
        }
    }
    delete this;    // 인증 스레드 종료...
    return 0;
}

void Auth::recvID(char *buf)
{
    char id[16];
    memset(&id, 0, sizeof(id));
    int len = 0;

    if(recv(inUser->getSocket(), (char*)&id, sizeof(id), 0) <= 0)
    {
        throw ChatException(SESSION_ERROR);
    }
    len = strnlen(id, MAXSTRID);
    strncpy(buf, id, strnlen(id, MAXSTRID));
    buf[len] = 0;
}

void Auth::sendInfo(const char *info)
{
    char inf[7];
    memset(&inf, 0, sizeof(inf));

    if(info != nullptr)
    {
        int len = strnlen(info, MAXSTRID);
        strncpy(inf, info, len);
        inf[len] = 0;
    }

    pthread_mutex_lock(&App::pMutex);
    if(send(inUser->getSocket(), (const char*)&inf, sizeof(inf), 0) <= 0)
    {
        pthread_mutex_unlock(&App::pMutex);
        throw ChatException(SESSION_ERROR);
    }
    pthread_mutex_unlock(&App::pMutex);
}

Auth::~Auth() {}

void Auth::recvRoomNum(char *buf)
{
    const char createRoomCom[7] = "0x0110";

    while(strncmp(inUser->getRoomName(), "", 3) == 0)
    {
        char *sendID = new char();
        char *recvID = new char();
        int len = App::userList.size();
        int room_len = 0;
        int j = 0;
        for(int i = 0; i < len; i++)
        {
            User *user = App::userList.at(i);   // 기존 사용자
            if(strncmp(user->getRoomName(), "", 3) != 0)
            {
                if(i != 0)
                {
                    User *_user = App::userList.at(j);
                    if (strncmp(user->getRoomName(), _user->getRoomName(), 3) == 0)
                    {
                        continue;
                    }
                }
                room_len = strnlen(user->getRoomName(), 3);
                strncpy(sendID, user->getRoomName(), room_len);
                sendID[room_len] = 0;
                pthread_mutex_lock(&App::pMutex);

                if(send(inUser->getRoomSocket(), sendID, 3, 0) < 0)
                {
                    pthread_mutex_unlock(&App::pMutex);
                    throw ChatException(SESSION_ERROR);
                }
                else
                {
                    j = i;
                }
                pthread_mutex_unlock(&App::pMutex);
            }
        }

        // 방 제목을 넘겨 받음,,
        if(recv(inUser->getRoomSocket(), recvID, sizeof(recvID), 0) <= 0)
        {
            throw ChatException(SESSION_ERROR);
        }

        len = strnlen(recvID, 7);
        strncpy(buf, recvID, len);
        buf[len] = 0;

        if(strncmp(buf, createRoomCom, 7) != 0)
        {
            inUser->setRoomName(buf);
        }
        else
        {
            if(roomNum < 10)
            {
                sprintf(buf, "00%d", roomNum);
            }
            else if(roomNum < 100)
            {
                sprintf(buf, "0%d", roomNum);
            }
            else
            {
                sprintf(buf, "%d", roomNum);
            }
            inUser->setRoomName(buf);
            roomNum++;  // 방 번호 증가..
        }
    }

    // 다시 방 번호를 넘겨줌..
    pthread_mutex_lock(&App::pMutex);
    if(send(inUser->getRoomSocket(), buf, 3, 0) <= 0)
    {
        pthread_mutex_unlock(&App::pMutex);
        throw ChatException(SESSION_ERROR);
    }
    pthread_mutex_unlock(&App::pMutex);
}

