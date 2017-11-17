# SimpleChat Server



| Linux / OS X                             | License                                  |
| :--------------------------------------- | :--------------------------------------- |
| [![Build Status](https://travis-ci.org/NEONKID/SimpleChat.svg?branch=server)](https://travis-ci.org/NEONKID/SimpleChat) | [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) |


This program uses POSIX Thread.  It can be used with operating systems that support POSIX threads.
In addition, it uses a Unix socket, so It is not compatible with Windows sockets.



## Get the Code

```
git clone https://github.com/neonkid/SimpleChat.git
```



## Needs

- CMake 3.7



### Build / Run

```bash
cmake CMakeLists.txt
```

```
make
```

```
./SimpleChat_Server_Fin
```



### How to use

The server program checks the file ID. Currently, this sample code has a sample login file named "simple_chat_Login.txt". You can modify the ID that can be accessed from the file.

The default port number is 1412. If you want to fix it, please fix it in the source code.