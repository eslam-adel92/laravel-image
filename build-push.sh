#!/bin/bash
docker build -t eslam2017/laravel-image:$1 .
docker push eslam2017/laravel-image:$1