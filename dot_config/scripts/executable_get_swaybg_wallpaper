#!/usr/bin/env bash

set -euo pipefail

ps aux | grep '[s]waybg' | awk '{for(i=1;i<=NF;i++) if($i=="-i") print $(i+1)}'
