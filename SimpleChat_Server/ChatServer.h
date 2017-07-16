//
// Created by neonkid on 5/25/17.
//

#ifndef DKU_CHAT_SERVER_FIN_CHATSERVER_H
#define DKU_CHAT_SERVER_FIN_CHATSERVER_H

#include <netinet/in.h>
#include <cstring>

#include "User.h"

class ChatServer
{
private:
    int server_socket;
    sockaddr_in server_address;

public:
    ChatServer(const char *ip = nullptr, int port = 0); // 생성자, 초기 서버 생성할 때 씀.
    ~ChatServer();  // 소멸자, 서버 소멸시의 로직.

    void binding(); // 바인딩 작업,,
    void listening(int size);   // 리스닝 작업,,
    User *acceptUser(); // 사용자 접속 수락,,
};


#endif //DKU_CHAT_SERVER_FIN_CHATSERVER_H
