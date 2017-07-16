//
// Created by neonkid on 5/25/17.
//

#ifndef DKU_CHAT_SERVER_FIN_CHATEXCEPTION_H
#define DKU_CHAT_SERVER_FIN_CHATEXCEPTION_H

#include <iostream>

#define SOCKET_ERROR    1000
#define BIND_ERROR  1001
#define LISTEN_ERROR    1002
#define SESSION_ERROR   1100
#define SEND_ERROR  1101

using std::cerr;
using std::endl;

class ChatException
{
private:
    int code;   // 예외 코드,,

public:
    ChatException(int code) : code(code) {}
    int getCode() const { return code; }
    void printError()
    {
        switch(code)
        {
            case 1000:
                cerr << "소켓 생성 오류 (에러 코드: " << code << ")" << endl;
                break;

            case 1001:
                cerr << "소켓 바인딩 오류 (에러 코드: " << code << ")" << endl;
                break;

            case 1002:
                cerr << "소켓 리스닝 오류 (에러 코드: " << code << ")" << endl;
                break;

            case 1100:
                cerr << "세션 연결 오류 (에러 코드: " << code << ")" << endl;
                break;

            case 1101:
                cerr << "메시지 전송 오류 (에러 코드: " << code << ")" << endl;
                break;

            default:
                break;
        }
    }
};


#endif //DKU_CHAT_SERVER_FIN_CHATEXCEPTION_H
