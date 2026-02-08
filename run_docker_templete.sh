#!/bin/bash

# デフォルトのポート番号(引数がない場合)
MARIMO_PORT=${1:-2719}

docker run \
    --gpus all \
    --name asr_container \
    --shm-size=8g \
    -it \
    -d \
    -v /home/emoto/main/workspace/emoto_exp/:/workspaces/emoto_exp \
    -v /home/emoto/.ssh:/root/.ssh \
    -v /mnt/20240206M2SSD/:/home/emoto/SSD \
    -v /mnt/20250314M2SSD/:/home/emoto/SSD2 \
    -v /mnt/a6000HDD/:/home/emoto/a6000HDD \
    -v /mnt/melchorHDD/:/home/emoto/melchorHDD \
    -v /mnt/raid_3n1_4n1/:/home/emoto/raidSSD \
    -e TERM=$TERM \
    -p ${MARIMO_PORT}:${MARIMO_PORT} \
    --rm \
    asr_image bash
