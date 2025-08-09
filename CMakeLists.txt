cmake_minimum_required(VERSION 3.12)
project(example_libp2p_usage LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 标准的Conan使用方式 - 应该自动传播所有传递依赖
find_package(libp2p CONFIG REQUIRED)

# 创建示例可执行文件
add_executable(example_libp2p src/main.cpp)

# 标准的链接方式 - 应该自动传播传递依赖
target_link_libraries(example_libp2p libp2p::libp2p)

# 设置编译特性
target_compile_features(example_libp2p PRIVATE cxx_std_20)

