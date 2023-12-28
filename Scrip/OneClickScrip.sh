#    AutoBangumi-OneClickScrip
#    Deploy with one click for automatic tracking of anime, control container startup sequence, and quickly update containers. It primarily addresses the issue of slow qBittorrent startup after boot, which prevents AutoBangumi from accessing qBittorrent. The project is built on Synology DiskStation (DSM); for other platforms, please make modifications as needed based on your specific situation.
#    Copyright (C) <2023>  <AUKcl>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.
#    
#    AUKcl's email:kaixuan135@outloook.com

#!/bin/bash

# 定义 AutoBangumi 项目的路径
mkdir -p /volume1/docker/Bangumi/Autobangumi/config
mkdir -p /volume1/docker/Bangumi/Autobangumi/data
mkdir -p /volume1/docker/Bangumi/qBittorrent

# 下载默认docker-compose.yaml模板
wget -P /volume1/docker/Bangumi https://github.com/AUKcl/AutoBangumi-OneClickScrip/blob/main/compose.yaml

# 下载 AutoBangumi 项目启动脚本
wget -P /volume1/docker/Bangumi https://github.com/AUKcl/AutoBangumi-OneClickScrip/blob/main/Scrip/start_autobangumi.sh

# 下载 AutoBangumi 项目更新脚本
wget -P /volume1/docker/Bangumi https://github.com/AUKcl/AutoBangumi-OneClickScrip/blob/main/Scrip/update_autobangumi_containers.sh

# 执行 AutoBangumi 项目启动脚本
bash /volume1/docker/Bangumi/start_autobangumi.sh


