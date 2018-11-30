ADD_EXECUTABLE (main main.c)
# 添加 共享库 的头文件搜索路径
INCLUDE_DIRECTORIES(/usr/include/hello)

# 添加 共享库
TARGET_LINK_LIBRARIES(main libhello.so)
# TARGET_LINK_LIBRARIES(main libhello.a) 静态库的添加

