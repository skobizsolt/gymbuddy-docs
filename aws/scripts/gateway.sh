#!/bin/bash

nohup java -jar gymbuddy-api-gateway-0.0.1-SNAPSHOT.jar 2>&1 >> ./logs/gateway.log &