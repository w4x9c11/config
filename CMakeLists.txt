 cmake_minimum_required(VERSION 3.20)
 project(MyProject VERSION 1.0 LANGUAGES CXX)

 set(CMAKE_CXX_STANDARD 20)
 set(CMAKE_CXX_STANDARD_REQUIRED ON)
 set(CMAKE_CXX_EXTENSIONS OFF)
 set(CMAKE_EXPORT_COMPILE_COMMANDS ON)  # Generate compile_commands.json for clangd

 set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
 set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
 set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

 foreach(CONFIG ${CMAKE_CONFIGURATION_TYPES})
    string(TOUPPER ${CONFIG} UPPER_CONFIG)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_${UPPER_CONFIG} ${CMAKE_BINARY_DIR}/bin/${CONFIG})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_${UPPER_CONFIG} ${CMAKE_BINARY_DIR}/lib/${CONFIG})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_${UPPER_CONFIG} ${CMAKE_BINARY_DIR}/lib/${CONFIG})
 endforeach()

 include_directories(${PROJECT_SOURCE_DIR}/include)

 file(GLOB SOURCES "${PROJECT_SOURCE_DIR}/src/*.cpp")

 add_executable(${PROJECT_NAME} ${SOURCES})

 if(MSVC)
    target_compile_options(MyProject PRIVATE
        /utf-8          # UTF-8 encoding
        /W4             # High warning level
        /permissive-    # Strict standard compliance
        /MP             # Parallel build
    )
endif()
