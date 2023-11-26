#!/bin/bash

export DB_USER=skb
export DB_PWD=12345
export PORT=8082

nohup java -jar workout-runner-0.0.1-SNAPSHOT.jar 2>&1 >> ./logs/runner.log &