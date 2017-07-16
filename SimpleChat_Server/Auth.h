//
// Created by neonkid on 5/28/17.
//

#ifndef DKU_CHAT_SERVER_FIN_AUTH_H
#define DKU_CHAT_SERVER_FIN_AUTH_H

#include <fstream>
#include <cstring>

#include "App.h"
#include "AuthException.h"
#include "ChatThread.h"

using std::ifstream;

class Auth : public ChatThread
{
private:
    ifstream loginFile;
    User *inUser;

    ~Auth();
    void recvID(char *buf);
    void sendInfo(const char *info);
    void recvRoomNum(char *buf);

public:
    static const char login_Success[7];
    static const char login_Fail[7];
    static const int MAXSTRID = 16;

    Auth(User *user);
    void getloginInfo(char *outputID);
    void printNewUser(const User* user) const;
    void printExceedUser(const User* user) const;
    virtual int run(void) override;
};


#endif //DKU_CHAT_SERVER_FIN_AUTH_H
