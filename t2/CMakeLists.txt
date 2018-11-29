PROJECT(HELLO) 
#ADD_SUBDIRECTORY(src bin)
ADD_SUBDIRECTORY(src)

#安装的配置 下面全部使用 CMAKE_INSTALL_PREFIX 参数来进行相对路径的安装
# 安装COPYRIGHT/README
INSTALL(FILES COPYRIGHT README DESTINATION share/doc/cmake/t2)
# 安装runhello.sh
INSTALL(PROGRAMS runhello.sh DESTINATION bin)
# 安装doc中的hello.txt 两种安装方式，一种是通过 ADD_SUBDIRECTORY 进行安装，也就是把doc路径做成子目录，并且在子目录新建一个 CMakeLists.txt 文件
INSTALL(DIRECTORY doc/ DESTINATION share/doc/cmake/t2)

