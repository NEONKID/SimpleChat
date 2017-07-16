//
// Created by neonkid on 5/30/17.
//

#ifndef DKU_CHAT_SERVER_FIN_MOD_AUTHEXCEPTION_H
#define DKU_CHAT_SERVER_FIN_MOD_AUTHEXCEPTION_H

#include <iostream>

#define ID_NOT_FOUND    2000
#define FILE_NOT_FOUND  2001
#define CONNECTED_ID    2002
#define AUTH_THREAD_ERROR   2010

using std::cerr;
using std::endl;

class AuthException
{
private:
    int code;

public:
    AuthException(int code) : code(code) {}
    int getCode() const { return code; }
    void printError()
    {
        switch(code)
        {
            case 2000:
                cerr << "존재하지 않는 ID (에러 코드: " << code << ")" << endl;
                break;

            case 2001:
                cerr << "ID 파일을 찾을 수 없음 (에러 코드: " << code << ")" << endl;
                break;

            case 2002:
                cerr << "현재 사용 중인 ID.... (에러 코드: " << code << ")" << endl;
                break;

            case 2010:
                cerr << "인증 쓰레드 오류 발생 ... (에러 코드: " << code << ")" << endl;
                break;

            default:
                break;
        }
    }
};


#endif //DKU_CHAT_SERVER_FIN_MOD_AUTHEXCEPTION_H
