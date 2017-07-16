//
// Created by neonkid on 5/25/17.
//

#ifndef DKU_CHAT_SERVER_FIN_USER_H
#define DKU_CHAT_SERVER_FIN_USER_H

#include <vector>
#include <netinet/in.h>

#include "ChatException.h"
#include "ChatThread.h"

using std::cout;
using std::cin;
using std::endl;
using std::vector;
using std::stringstream;

typedef struct _MSG
{
    char id[16];
    char data[256];
} Message;

class User : public ChatThread
{
private:
    int client_socket, userList_sock, roomList_sock;
    sockaddr_in client_address;
    static const int MAXSTRLEN;
    char *id;   // User ID
    char *roomName;   // 방 번호,,

    void recvMessage(char *buf, char *id);
    void sendMessage(int socket, const char* buf = nullptr);

public:
    User(int cs, int send_s, int room_s, sockaddr_in ca);   // client socket, client address
    User(const User &user) {}
    void operator = (const User &user) {}
    ~User();

    char *getIP() const;
    int getPort() const;
    int getSocket() const;
    int getrecvIDSocket() const;
    int getRoomSocket() const;
    const char* getId() const;
    void setId(char *buf) const;
    void setRoomName(char *buf) const;
    const char* getRoomName() const;
    void closeSession();
    void eraseUserSent(void);
    void eraseUser();
    void sendUserList();
    void sendUserID(int socket, const char* buf = nullptr);

    void sendMessageAll(const char *buf = nullptr);
    void sendMessageSec(const char *buf = nullptr, const char *id = nullptr);

    virtual int run(void) override;
    void printLeaveUser(const User &user) const;
};


#endif //DKU_CHAT_SERVER_FIN_USER_H
