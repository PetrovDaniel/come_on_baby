#!/bin/bash

docker build -t ssh_scan_container -f ./docker/Dockerfile .

docker run -d -p 22:22 -v `pwd`:/mnt/data --name ssh_scan_container ssh_scan_container