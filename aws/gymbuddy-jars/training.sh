#!/bin/bash

export DB_USER=skb
export DB_PWD=12345
export PORT=8081

nohup java -jar gymbuddy-training-0.0.1-SNAPSHOT.jar 2>&1 >> ./logs/training.log &