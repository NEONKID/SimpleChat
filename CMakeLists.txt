cmake_minimum_required(VERSION 3.7)
project(SimpleChat_Server_Fin)

set(CMAKE_CXX_STANDARD 14)

set(SOURCE_FILES main.cpp ChatServer.cpp ChatServer.h ChatException.h User.cpp User.h App.cpp App.h ChatThread.cpp ChatThread.h Auth.cpp Auth.h AuthException.h)
add_executable(SimpleChat_Server_Fin ${SOURCE_FILES})

target_link_libraries(SimpleChat_Server_Fin pthread)