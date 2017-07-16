//
// Created by neonkid on 5/25/17.
//

#include "App.h"

vector<User*>App::userList = vector<User*>();
const int App::MAXUSER = 20;
pthread_mutex_t App::pMutex = PTHREAD_MUTEX_INITIALIZER;

App::App() : chatServer(nullptr, 1412)
{
    // 자기 자신의 IP 주소에 1412번 포트로 Listening....
}

void App::printNewUser(const User *user) const
{
    cout << "새로운 사용자가 접속 됨 ! " << user->getIP() << ", " << user->getPort() << ")" << endl;
}

void App::printExceedUser(const User *user) const
{
    cout << "새로운 사용자가 접속에 실패 함 !" << user->getIP() << ", " << user->getPort() << ")" << endl;
}

// 서버 구동 시작,,
void App::start()
{
    chatServer.binding();
    chatServer.listening(App::MAXUSER);

    cout << "Welcome !" << endl;
    cout << "Log : " << endl;

    while(true)
    {
        User *user = chatServer.acceptUser();   // accept된 사용자 객체 반환,,

        if(App::userList.size() >= App::MAXUSER)    // 해당 사용자가 접속할 수 있는지를 검사,,
        {
            printExceedUser(user);  // 접속 실패 메시지,,
            continue;
        }

        printNewUser(user);

        // ID checking...
        Auth *auth = new Auth(user);
        auth->start();
    }
}