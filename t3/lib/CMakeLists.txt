SET(LIBHELLO_SRC hello.c)
SET(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin) # 设置动态库生成的路径

ADD_LIBRARY(hello SHARED ${LIBHELLO_SRC})

# 我们向同时再生成一个 libhello.a 的静态库

# ADD_LIBRARY(hello STATIC ${LIBHELLO_SRC})  # 直接添加这个是无效的，因为hello作为一个 target 不能重名
# ADD_LIBRARY(hello_static STATIC ${LIBHELLO_SRC}) # 这样就会生成一个 libhello_static.a 非我所愿
# 使用 SET_TARGET_PROPERTIES 配合使用，实现我们的目的
ADD_LIBRARY(hello_static STATIC ${LIBHELLO_SRC}) 
SET_TARGET_PROPERTIES(hello_static PROPERTIES OUTPUT_NAME "hello")
# 打印出上面的配置信息
GET_TARGET_PROPERTY(OUTPUT_VALUE hello_static OUTPUT_NAME)
MESSAGE(STATUS "*****This is the hello_static OUTPUT_NAME : ******" ${OUTPUT_VALUE})

# 上面这样的设置 可能会只生成 静态库， 但是动态库却消失了，原因就是 cmake 在构建一个新的 target 的时候，会尝试清理掉其他使用这个名字的库，因为，在构建libhello.a 时，就会清理掉libhello.so.
SET_TARGET_PROPERTIES(hello PROPERTIES CLEAN_DIRECT_OUTPUT 1)
SET_TARGET_PROPERTIES(hello_static PROPERTIES CLEAN_DIRECT_OUTPUT 1)

# 设置动态库版本号 使用 SET_TARGET_PROPERTIES 
SET_TARGET_PROPERTIES(hello PROPERTIES VERSION 1.2 SOVERSION 1) 
# 在build/lib 目录会生成：libhello.so.1.2 libhello.so.1->libhello.so.1.2 libhello.so ->libhello.so.1

# 安装 共享库 静态和动态库  &&  头文件 hello.h,  同样使用 相对路径进行安装 编译指定 CMAKE_INSTALL_PREFIX
INSTALL (
TARGETS hello hello_static 
LIBRARY DESTINATION lib
ARCHIVE DESTINATION lib
)

INSTALL(
FILES hello.h
DESTINATION include/hello
)
