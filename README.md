# 缘之空：高清重制 For Linux

本仓库是《缘之空》高清重制的Linux版适配，上游仓库位于
[shuimo0413/yosuga-no-sora-remake](https://github.com/shuimo0413/yosuga-no-sora-remake)。
Linux系统跨平台运行时为 Kirikiri SDL2 引擎的校医版分支 [kota-rina3/krkrsdl2](https://github.com/kota-rina3/krkrsdl2)

## 项目结构

- `data/`：游戏资源，包含脚本、图片、字体、音频和视频素材。
- `yosuga_no_sora.cf`：游戏配置和校验。
- `yosuga_no_sora.amd64`: Linux x86_64 架构可执行文件，适配 Intel 和 AMD 两家的 CPU。
- `yosuga_no_sora.arm64`: Linux ARM64 架构可执行文件，适配 ARM 架构的 CPU。
- `yosuga_no_sora.loong64`: Linux 龙架构（LoongArch64）可执行文件，适配 龙芯中科 3A5000 及以上的 CPU，仅支持`新世界发行版`（如 debian 13 及以上、deepin 23 及以上和 Loongnix 25）运行。

## 获取游戏资源

前往上游release获取游戏资源，并解压到同目录下。
若有提示，选择替换即可。

## 获取并运行二进制文件

前往本项目的release获取二进制文件，并解压到游戏根目录。
由于视频无法播放，运行前进入`data/`目录，删除`.mp4/`视频文件。
删除后，给权限并运行`./yosuga_no_sora.架构名`即可游玩。

## 当前状态

本项目仅支持Linux，适配amd64、arm64和龙架构。
其他系统请访问上游仓库。

## 运行截图

<img width="1366" height="768" alt="yosuga-deepin" src="https://github.com/user-attachments/assets/e5f2e1e8-37c0-4e77-8ae3-16e2dd25295c" />

## 已知问题

视频无法播放，只能删除`data/`目录下的`.mp4/`文件来规避。
