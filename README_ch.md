## Description
优化 workflow，包括：
1. 阻止 fiddler-everywhere 更新的脚本，解决了一旦更新 pro 不再可用的问题；
2. powershell 脚本自动搜索 main.js 中 updateUserLicense 函数并进行替换；
3. 不再需要使用 dnspy 等软件反编译，魔改好的 dll 文件直接覆盖，封装为 powershell 脚本右键执行。

## Steps
- 安装 fiddler-everywhere-4.0.1 并登录账号
- 执行 disableUpdater.ps1 脚本以删除 updater 文件夹内下载好的内容并禁止访问
- 执行 mockMainUserLicense.ps1 脚本修改混淆代码中的 pro 证书信息
- 执行 mockDllFiles.ps1 脚本修改 dll 文件中的 UserAccountDTO.id 状态判断
- 打开 fiddler-everywhere 程序，即可使用永久无限制版本

## TODOs
1. 编写 shell 脚本适配 intel 芯片版本的 macos
2. 适配更高版本的 4.1.2