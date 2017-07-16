//
// Created by neonkid on 5/25/17.
//

#ifndef DKU_CHAT_SERVER_FIN_CHATTHREAD_H
#define DKU_CHAT_SERVER_FIN_CHATTHREAD_H

#include <pthread.h>
#include <iostream>

using std::cout;

class ChatThread
{
private:
    pthread_t cThread;
    static int retval;

public:
    ChatThread();
    virtual ~ChatThread();
    virtual int run(void) = 0;  // Pure Virtual Function (Abstract class Method in Java)
    static void *_run(void *arg);

    virtual void start();
    int join();

    virtual void setRetval(int r);
    bool isRunning();
};


#endif // DKU_CHAT_SERVER_FIN_CHATTHREAD_H
