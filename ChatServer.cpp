//
// Created by neonkid on 5/25/17.
//

#include <unistd.h>

#include "ChatServer.h"

ChatServer::ChatServer(const char *ip, int port)
{
    this->server_socket = socket(PF_INET, SOCK_STREAM, 0);
    if(this->server_socket < 0)
    {
        throw ChatException(SOCKET_ERROR);
    }

    memset(&this->server_address, 0, sizeof(this->server_address));
    if(ip != nullptr)
    {
        this->server_address.sin_addr.s_addr = htonl(atoi(ip));
    }
    else
    {
        this->server_address.sin_addr.s_addr = htonl(INADDR_ANY);
    }
    this->server_address.sin_port = htons(port);
    this->server_address.sin_family = AF_INET;
}

ChatServer::~ChatServer()
{
    close(this->server_socket);
}

void ChatServer::binding()
{
    if(bind(this->server_socket, (struct sockaddr*)&this->server_address, sizeof(this->server_address)) < 0)
    {
        throw ChatException(BIND_ERROR);
    }
}

void ChatServer::listening(int size)
{
    // 접속자 수가 0 미만이 될 수는 없음 !
    if(size <= 0)
    {
        throw ChatException(LISTEN_ERROR);
    }
    if(listen(this->server_socket, size) < 0)
    {
        throw ChatException(LISTEN_ERROR);
    }
}

User* ChatServer::acceptUser()
{
    int client_socket, recvlist_sock, roomlist_sock;
    sockaddr_in client_address;
    socklen_t len = sizeof(client_address);

    // 서버 소켓은, Listen sock, 클라이언트 소켓은 accp_sock, 방 리스트 소켓은 roomlist_sock
    client_socket = accept(this->server_socket, (struct sockaddr*)&client_address, &len);
    recvlist_sock = accept(this->server_socket, (struct sockaddr*)&client_address, &len);
    roomlist_sock = accept(this->server_socket, (struct sockaddr*)&client_address, &len);

    return new User(client_socket, recvlist_sock, roomlist_sock, client_address); // 서버 소켓을 사용해 클라이언트와 연결...
}

