//
// Created by neonkid on 5/25/17.
//

#include <csignal>

#include "ChatThread.h"

int ChatThread::retval = 0;

ChatThread::ChatThread() {}

ChatThread::~ChatThread() {}

void* ChatThread::_run(void *arg)
{
    ChatThread *pthis = (ChatThread*)arg;
    pthis->setRetval(pthis->run());
    pthread_exit(NULL);
}

void ChatThread::start()
{
    pthread_create(&cThread, NULL, ChatThread::_run, (void*)this);
}

int ChatThread::join()
{
    pthread_join(cThread, (void**)&retval);
    return retval;  // join 하고 나서 반환할 값..
}

void ChatThread::setRetval(int r)
{
    retval = r;
}

bool ChatThread::isRunning()
{
    if(cThread)
    {
        int resExitCode = 0;
        pthread_kill(pthread_self(), resExitCode);

        if(resExitCode > 0)
        {
            return true;
        }
    }
    return false;
}
