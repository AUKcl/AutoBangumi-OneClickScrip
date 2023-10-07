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

# 定义 Docker Compose 文件的路径
COMPOSE_FILE="AutoBangumi.yml"

# 定义 qbittorrent 容器的名称
QB_CONTAINER="qbittorrent"

# 定义 autobangumi 容器的名称
AUTOBANGUMI_CONTAINER="AutoBangumi"

# 定义用于测试 qbittorrent 可访问性的 URL
QB_URL="http://localhost:8989"

# 定义最大重试次数
MAX_RETRIES=300

# 定义重试间隔（秒）
RETRY_INTERVAL=10

# 检测 qbittorrent 是否可访问的函数
function is_qbittorrent_accessible() {
  curl --silent --fail $QB_URL > /dev/null
}

# 等待 qbittorrent 可访问的函数
function wait_for_qbittorrent() {
  retries=0
  while ! is_qbittorrent_accessible; do
    retries=$((retries + 1))
    if [ $retries -ge $MAX_RETRIES ]; then
      echo "达到最大重试次数，qbittorrent 无法访问。"
      exit 1
    fi
    echo "等待 qbittorrent 可访问..."
    sleep $RETRY_INTERVAL
  done
  echo "qbittorrent 可访问。"
}

# 启动 qbittorrent 服务
echo "启动 qbittorrent 服务..."
docker-compose -f $COMPOSE_FILE up -d $QB_CONTAINER

# 检测 qbittorrent 可访问性
echo "检测 qbittorrent 可访问性..."
wait_for_qbittorrent

# 启动 AutoBangumi 服务
echo "启动 AutoBangumi 服务..."
docker-compose -f $COMPOSE_FILE up -d $AUTOBANGUMI_CONTAINER

echo "AutoBangumi 服务已启动。"
