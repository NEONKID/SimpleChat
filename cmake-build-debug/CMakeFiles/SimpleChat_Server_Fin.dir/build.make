# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.7

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/clion-2017.1.2/bin/cmake/bin/cmake

# The command to remove a file.
RM = /opt/clion-2017.1.2/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/neonkid/ClionProjects/SimpleChat_Server

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/neonkid/ClionProjects/SimpleChat_Server/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/SimpleChat_Server_Fin.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/SimpleChat_Server_Fin.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/SimpleChat_Server_Fin.dir/flags.make

CMakeFiles/SimpleChat_Server_Fin.dir/main.cpp.o: CMakeFiles/SimpleChat_Server_Fin.dir/flags.make
CMakeFiles/SimpleChat_Server_Fin.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/neonkid/ClionProjects/SimpleChat_Server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/SimpleChat_Server_Fin.dir/main.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SimpleChat_Server_Fin.dir/main.cpp.o -c /home/neonkid/ClionProjects/SimpleChat_Server/main.cpp

CMakeFiles/SimpleChat_Server_Fin.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SimpleChat_Server_Fin.dir/main.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/neonkid/ClionProjects/SimpleChat_Server/main.cpp > CMakeFiles/SimpleChat_Server_Fin.dir/main.cpp.i

CMakeFiles/SimpleChat_Server_Fin.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SimpleChat_Server_Fin.dir/main.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/neonkid/ClionProjects/SimpleChat_Server/main.cpp -o CMakeFiles/SimpleChat_Server_Fin.dir/main.cpp.s

CMakeFiles/SimpleChat_Server_Fin.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/SimpleChat_Server_Fin.dir/main.cpp.o.requires

CMakeFiles/SimpleChat_Server_Fin.dir/main.cpp.o.provides: CMakeFiles/SimpleChat_Server_Fin.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/SimpleChat_Server_Fin.dir/build.make CMakeFiles/SimpleChat_Server_Fin.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/SimpleChat_Server_Fin.dir/main.cpp.o.provides

CMakeFiles/SimpleChat_Server_Fin.dir/main.cpp.o.provides.build: CMakeFiles/SimpleChat_Server_Fin.dir/main.cpp.o


CMakeFiles/SimpleChat_Server_Fin.dir/ChatServer.cpp.o: CMakeFiles/SimpleChat_Server_Fin.dir/flags.make
CMakeFiles/SimpleChat_Server_Fin.dir/ChatServer.cpp.o: ../ChatServer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/neonkid/ClionProjects/SimpleChat_Server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/SimpleChat_Server_Fin.dir/ChatServer.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SimpleChat_Server_Fin.dir/ChatServer.cpp.o -c /home/neonkid/ClionProjects/SimpleChat_Server/ChatServer.cpp

CMakeFiles/SimpleChat_Server_Fin.dir/ChatServer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SimpleChat_Server_Fin.dir/ChatServer.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/neonkid/ClionProjects/SimpleChat_Server/ChatServer.cpp > CMakeFiles/SimpleChat_Server_Fin.dir/ChatServer.cpp.i

CMakeFiles/SimpleChat_Server_Fin.dir/ChatServer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SimpleChat_Server_Fin.dir/ChatServer.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/neonkid/ClionProjects/SimpleChat_Server/ChatServer.cpp -o CMakeFiles/SimpleChat_Server_Fin.dir/ChatServer.cpp.s

CMakeFiles/SimpleChat_Server_Fin.dir/ChatServer.cpp.o.requires:

.PHONY : CMakeFiles/SimpleChat_Server_Fin.dir/ChatServer.cpp.o.requires

CMakeFiles/SimpleChat_Server_Fin.dir/ChatServer.cpp.o.provides: CMakeFiles/SimpleChat_Server_Fin.dir/ChatServer.cpp.o.requires
	$(MAKE) -f CMakeFiles/SimpleChat_Server_Fin.dir/build.make CMakeFiles/SimpleChat_Server_Fin.dir/ChatServer.cpp.o.provides.build
.PHONY : CMakeFiles/SimpleChat_Server_Fin.dir/ChatServer.cpp.o.provides

CMakeFiles/SimpleChat_Server_Fin.dir/ChatServer.cpp.o.provides.build: CMakeFiles/SimpleChat_Server_Fin.dir/ChatServer.cpp.o


CMakeFiles/SimpleChat_Server_Fin.dir/User.cpp.o: CMakeFiles/SimpleChat_Server_Fin.dir/flags.make
CMakeFiles/SimpleChat_Server_Fin.dir/User.cpp.o: ../User.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/neonkid/ClionProjects/SimpleChat_Server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/SimpleChat_Server_Fin.dir/User.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SimpleChat_Server_Fin.dir/User.cpp.o -c /home/neonkid/ClionProjects/SimpleChat_Server/User.cpp

CMakeFiles/SimpleChat_Server_Fin.dir/User.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SimpleChat_Server_Fin.dir/User.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/neonkid/ClionProjects/SimpleChat_Server/User.cpp > CMakeFiles/SimpleChat_Server_Fin.dir/User.cpp.i

CMakeFiles/SimpleChat_Server_Fin.dir/User.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SimpleChat_Server_Fin.dir/User.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/neonkid/ClionProjects/SimpleChat_Server/User.cpp -o CMakeFiles/SimpleChat_Server_Fin.dir/User.cpp.s

CMakeFiles/SimpleChat_Server_Fin.dir/User.cpp.o.requires:

.PHONY : CMakeFiles/SimpleChat_Server_Fin.dir/User.cpp.o.requires

CMakeFiles/SimpleChat_Server_Fin.dir/User.cpp.o.provides: CMakeFiles/SimpleChat_Server_Fin.dir/User.cpp.o.requires
	$(MAKE) -f CMakeFiles/SimpleChat_Server_Fin.dir/build.make CMakeFiles/SimpleChat_Server_Fin.dir/User.cpp.o.provides.build
.PHONY : CMakeFiles/SimpleChat_Server_Fin.dir/User.cpp.o.provides

CMakeFiles/SimpleChat_Server_Fin.dir/User.cpp.o.provides.build: CMakeFiles/SimpleChat_Server_Fin.dir/User.cpp.o


CMakeFiles/SimpleChat_Server_Fin.dir/App.cpp.o: CMakeFiles/SimpleChat_Server_Fin.dir/flags.make
CMakeFiles/SimpleChat_Server_Fin.dir/App.cpp.o: ../App.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/neonkid/ClionProjects/SimpleChat_Server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/SimpleChat_Server_Fin.dir/App.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SimpleChat_Server_Fin.dir/App.cpp.o -c /home/neonkid/ClionProjects/SimpleChat_Server/App.cpp

CMakeFiles/SimpleChat_Server_Fin.dir/App.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SimpleChat_Server_Fin.dir/App.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/neonkid/ClionProjects/SimpleChat_Server/App.cpp > CMakeFiles/SimpleChat_Server_Fin.dir/App.cpp.i

CMakeFiles/SimpleChat_Server_Fin.dir/App.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SimpleChat_Server_Fin.dir/App.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/neonkid/ClionProjects/SimpleChat_Server/App.cpp -o CMakeFiles/SimpleChat_Server_Fin.dir/App.cpp.s

CMakeFiles/SimpleChat_Server_Fin.dir/App.cpp.o.requires:

.PHONY : CMakeFiles/SimpleChat_Server_Fin.dir/App.cpp.o.requires

CMakeFiles/SimpleChat_Server_Fin.dir/App.cpp.o.provides: CMakeFiles/SimpleChat_Server_Fin.dir/App.cpp.o.requires
	$(MAKE) -f CMakeFiles/SimpleChat_Server_Fin.dir/build.make CMakeFiles/SimpleChat_Server_Fin.dir/App.cpp.o.provides.build
.PHONY : CMakeFiles/SimpleChat_Server_Fin.dir/App.cpp.o.provides

CMakeFiles/SimpleChat_Server_Fin.dir/App.cpp.o.provides.build: CMakeFiles/SimpleChat_Server_Fin.dir/App.cpp.o


CMakeFiles/SimpleChat_Server_Fin.dir/ChatThread.cpp.o: CMakeFiles/SimpleChat_Server_Fin.dir/flags.make
CMakeFiles/SimpleChat_Server_Fin.dir/ChatThread.cpp.o: ../ChatThread.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/neonkid/ClionProjects/SimpleChat_Server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/SimpleChat_Server_Fin.dir/ChatThread.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SimpleChat_Server_Fin.dir/ChatThread.cpp.o -c /home/neonkid/ClionProjects/SimpleChat_Server/ChatThread.cpp

CMakeFiles/SimpleChat_Server_Fin.dir/ChatThread.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SimpleChat_Server_Fin.dir/ChatThread.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/neonkid/ClionProjects/SimpleChat_Server/ChatThread.cpp > CMakeFiles/SimpleChat_Server_Fin.dir/ChatThread.cpp.i

CMakeFiles/SimpleChat_Server_Fin.dir/ChatThread.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SimpleChat_Server_Fin.dir/ChatThread.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/neonkid/ClionProjects/SimpleChat_Server/ChatThread.cpp -o CMakeFiles/SimpleChat_Server_Fin.dir/ChatThread.cpp.s

CMakeFiles/SimpleChat_Server_Fin.dir/ChatThread.cpp.o.requires:

.PHONY : CMakeFiles/SimpleChat_Server_Fin.dir/ChatThread.cpp.o.requires

CMakeFiles/SimpleChat_Server_Fin.dir/ChatThread.cpp.o.provides: CMakeFiles/SimpleChat_Server_Fin.dir/ChatThread.cpp.o.requires
	$(MAKE) -f CMakeFiles/SimpleChat_Server_Fin.dir/build.make CMakeFiles/SimpleChat_Server_Fin.dir/ChatThread.cpp.o.provides.build
.PHONY : CMakeFiles/SimpleChat_Server_Fin.dir/ChatThread.cpp.o.provides

CMakeFiles/SimpleChat_Server_Fin.dir/ChatThread.cpp.o.provides.build: CMakeFiles/SimpleChat_Server_Fin.dir/ChatThread.cpp.o


CMakeFiles/SimpleChat_Server_Fin.dir/Auth.cpp.o: CMakeFiles/SimpleChat_Server_Fin.dir/flags.make
CMakeFiles/SimpleChat_Server_Fin.dir/Auth.cpp.o: ../Auth.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/neonkid/ClionProjects/SimpleChat_Server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/SimpleChat_Server_Fin.dir/Auth.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SimpleChat_Server_Fin.dir/Auth.cpp.o -c /home/neonkid/ClionProjects/SimpleChat_Server/Auth.cpp

CMakeFiles/SimpleChat_Server_Fin.dir/Auth.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SimpleChat_Server_Fin.dir/Auth.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/neonkid/ClionProjects/SimpleChat_Server/Auth.cpp > CMakeFiles/SimpleChat_Server_Fin.dir/Auth.cpp.i

CMakeFiles/SimpleChat_Server_Fin.dir/Auth.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SimpleChat_Server_Fin.dir/Auth.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/neonkid/ClionProjects/SimpleChat_Server/Auth.cpp -o CMakeFiles/SimpleChat_Server_Fin.dir/Auth.cpp.s

CMakeFiles/SimpleChat_Server_Fin.dir/Auth.cpp.o.requires:

.PHONY : CMakeFiles/SimpleChat_Server_Fin.dir/Auth.cpp.o.requires

CMakeFiles/SimpleChat_Server_Fin.dir/Auth.cpp.o.provides: CMakeFiles/SimpleChat_Server_Fin.dir/Auth.cpp.o.requires
	$(MAKE) -f CMakeFiles/SimpleChat_Server_Fin.dir/build.make CMakeFiles/SimpleChat_Server_Fin.dir/Auth.cpp.o.provides.build
.PHONY : CMakeFiles/SimpleChat_Server_Fin.dir/Auth.cpp.o.provides

CMakeFiles/SimpleChat_Server_Fin.dir/Auth.cpp.o.provides.build: CMakeFiles/SimpleChat_Server_Fin.dir/Auth.cpp.o


# Object files for target SimpleChat_Server_Fin
SimpleChat_Server_Fin_OBJECTS = \
"CMakeFiles/SimpleChat_Server_Fin.dir/main.cpp.o" \
"CMakeFiles/SimpleChat_Server_Fin.dir/ChatServer.cpp.o" \
"CMakeFiles/SimpleChat_Server_Fin.dir/User.cpp.o" \
"CMakeFiles/SimpleChat_Server_Fin.dir/App.cpp.o" \
"CMakeFiles/SimpleChat_Server_Fin.dir/ChatThread.cpp.o" \
"CMakeFiles/SimpleChat_Server_Fin.dir/Auth.cpp.o"

# External object files for target SimpleChat_Server_Fin
SimpleChat_Server_Fin_EXTERNAL_OBJECTS =

SimpleChat_Server_Fin: CMakeFiles/SimpleChat_Server_Fin.dir/main.cpp.o
SimpleChat_Server_Fin: CMakeFiles/SimpleChat_Server_Fin.dir/ChatServer.cpp.o
SimpleChat_Server_Fin: CMakeFiles/SimpleChat_Server_Fin.dir/User.cpp.o
SimpleChat_Server_Fin: CMakeFiles/SimpleChat_Server_Fin.dir/App.cpp.o
SimpleChat_Server_Fin: CMakeFiles/SimpleChat_Server_Fin.dir/ChatThread.cpp.o
SimpleChat_Server_Fin: CMakeFiles/SimpleChat_Server_Fin.dir/Auth.cpp.o
SimpleChat_Server_Fin: CMakeFiles/SimpleChat_Server_Fin.dir/build.make
SimpleChat_Server_Fin: CMakeFiles/SimpleChat_Server_Fin.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/neonkid/ClionProjects/SimpleChat_Server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX executable SimpleChat_Server_Fin"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/SimpleChat_Server_Fin.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/SimpleChat_Server_Fin.dir/build: SimpleChat_Server_Fin

.PHONY : CMakeFiles/SimpleChat_Server_Fin.dir/build

CMakeFiles/SimpleChat_Server_Fin.dir/requires: CMakeFiles/SimpleChat_Server_Fin.dir/main.cpp.o.requires
CMakeFiles/SimpleChat_Server_Fin.dir/requires: CMakeFiles/SimpleChat_Server_Fin.dir/ChatServer.cpp.o.requires
CMakeFiles/SimpleChat_Server_Fin.dir/requires: CMakeFiles/SimpleChat_Server_Fin.dir/User.cpp.o.requires
CMakeFiles/SimpleChat_Server_Fin.dir/requires: CMakeFiles/SimpleChat_Server_Fin.dir/App.cpp.o.requires
CMakeFiles/SimpleChat_Server_Fin.dir/requires: CMakeFiles/SimpleChat_Server_Fin.dir/ChatThread.cpp.o.requires
CMakeFiles/SimpleChat_Server_Fin.dir/requires: CMakeFiles/SimpleChat_Server_Fin.dir/Auth.cpp.o.requires

.PHONY : CMakeFiles/SimpleChat_Server_Fin.dir/requires

CMakeFiles/SimpleChat_Server_Fin.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/SimpleChat_Server_Fin.dir/cmake_clean.cmake
.PHONY : CMakeFiles/SimpleChat_Server_Fin.dir/clean

CMakeFiles/SimpleChat_Server_Fin.dir/depend:
	cd /home/neonkid/ClionProjects/SimpleChat_Server/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/neonkid/ClionProjects/SimpleChat_Server /home/neonkid/ClionProjects/SimpleChat_Server /home/neonkid/ClionProjects/SimpleChat_Server/cmake-build-debug /home/neonkid/ClionProjects/SimpleChat_Server/cmake-build-debug /home/neonkid/ClionProjects/SimpleChat_Server/cmake-build-debug/CMakeFiles/SimpleChat_Server_Fin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/SimpleChat_Server_Fin.dir/depend
