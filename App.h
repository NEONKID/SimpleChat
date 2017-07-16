//
// Created by neonkid on 5/25/17.
//

#ifndef DKU_CHAT_SERVER_FIN_APP_H
#define DKU_CHAT_SERVER_FIN_APP_H

#include <vector>
#include <sstream>
#include <fstream>

#include "ChatServer.h"
#include "User.h"
#include "Auth.h"

class App
{
private:
    ChatServer chatServer;  // 새로운 서버 객체 생성,,
    static const int MAXUSER;

public:
    App();

    void start();
    void printNewUser(const User* user) const;
    void printExceedUser(const User* user) const;

    static vector<User*> userList;  // 이 서버에서 같이 사용하게 될 userList.
    static pthread_mutex_t pMutex;  // 이 프로그램이 같이 사용하게 될 Mutex
};


#endif //DKU_CHAT_SERVER_FIN_APP_H
