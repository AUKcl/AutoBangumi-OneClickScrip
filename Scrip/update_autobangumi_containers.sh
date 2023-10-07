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

# 定义要更新的 Docker Compose 文件的路径
COMPOSE_FILE="AutoBangumi.yml"

# 输出步骤提示
echo "Step 1: 停止容器"
# 停止容器，不删除
docker-compose -f $COMPOSE_FILE stop

# 输出步骤提示
echo "Step 2: 拉取最新容器镜像"
# 拉取最新容器镜像
docker-compose -f $COMPOSE_FILE pull

# 输出步骤提示
echo "Step 3: 重新启动容器"
# 重新启动容器
./start_autobangumi.sh

echo "容器已更新。"
