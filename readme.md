# libp2p Conan 使用示例

这个项目演示了如何在 C++ 项目中使用 Conan 包管理器来集成 libp2p 库。

## 项目结构

```
conan-libp2p-demo/
├── CMakeLists.txt      # CMake 配置文件
├── conanfile.txt       # Conan 依赖配置
├── build.sh           # 编译脚本
├── run.sh             # 运行脚本
├── src/
│   └── main.cpp       # 主程序源码
└── readme.md          # 项目说明
```

## 系统要求

```shell
$ conan --version 
Conan version 2.10.2
```

```shell
$ cmake --version
cmake version 3.31.2

CMake suite maintained and supported by Kitware (kitware.com/cmake).
```

```shell
$ gcc --version
Apple clang version 16.0.0 (clang-1600.0.26.4)
Target: arm64-apple-darwin24.1.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
```

## 依赖配置

### conanfile.txt
```
[requires]
libp2p/0.1.37

[generators]
CMakeDeps
CMakeToolchain

[layout]
cmake_layout
```

### CMakeLists.txt
使用标准的 Conan 集成方式：
```cmake
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
```

## 功能演示

程序演示了 libp2p 的核心功能：

- **Peer ID 创建**：支持从公钥数据、base58 字符串、字节数组等多种方式创建
- **Multiaddress 解析**：解析和处理网络地址（IPv4、IPv6、DNS 等）
- **多重哈希操作**：处理 libp2p 标准的哈希格式
- **加密组件**：验证加密模块的可用性

## 编译和运行

### 编译
```shell
$ ./build.sh
```

编译过程包括：
1. 清理构建目录
2. 安装 Conan 依赖
3. 配置 CMake
4. 编译项目

### 运行
```shell
$ ./run.sh
```

## 运行结果示例

```
=== libp2p 使用示例 ===

1. 测试 Peer ID 创建
✓ 成功从公钥数据创建 Peer ID: 12D3KooWB3Ro5C6Myi14cJmZpmtTtJ3N5JAR6QLqmeRHyc8XrZXM
  Peer ID 长度: 52 字符

1.2 测试从已知 base58 字符串创建 PeerId
✓ 成功从 base58 创建 Peer ID: 12D3KooWBhKNKkL6qTTvKXivnX2JgKPFnHZRNmXqnJQv1F1rSDvL

1.3 测试从字节数组创建 PeerId
✓ 成功从字节数组创建 Peer ID: QmNQatwxYrvx45JHzALe54be3KTBVQrLtHdPfkmvNNhQkw

2. 测试 Multiaddress 功能
✓ 成功解析 Multiaddress: /ip4/127.0.0.1/tcp/8000
  包含协议数量: 2
    - 协议: ip4 (编码: 4)
    - 协议: tcp (编码: 6)

3. 测试更多 Multiaddress 格式
✓ /ip4/192.168.1.1/tcp/1234 -> /ip4/192.168.1.1/tcp/1234
✓ /ip6/::1/tcp/5001 -> /ip6/::1/tcp/5001
✓ /dns4/example.com/tcp/443 -> /dns4/example.com/tcp/443

4. libp2p 基本信息
✓ libp2p 库成功加载
✓ PeerId 创建功能正常
✓ Multiaddress 解析功能正常
✓ 加密模块可用 (通过编译检查)

=== libp2p 示例运行完成 ===
所有基本功能测试通过！libp2p 库可以正常使用。
```

## 技术特性

- **C++20 标准**：使用现代 C++ 特性
- **Conan 包管理**：自动处理依赖关系
- **跨平台支持**：支持 macOS、Linux 等平台
- **静态链接**：优化部署和分发

## 依赖包信息

libp2p/0.1.37 包自动引入了以下传递依赖：
- boost/1.87.0
- boringssl/qdrvm1
- protobuf/3.21.12
- yaml-cpp/0.6.2-0f9a586-p1
- 其他必要的加密和网络库

## 说明

本项目展示了 libp2p/0.1.37 包在 C++ 项目中的基本集成和使用。通过 Conan 包管理器实现依赖管理，使用 CMake 构建系统。

**主要特点**：
- 标准的 Conan + CMake 工作流
- 演示核心 libp2p 组件的使用
- 包含完善的错误处理
- C++20 现代特性支持

**适用场景**：P2P 网络应用、分布式系统、区块链项目等需要 libp2p 功能的场景。