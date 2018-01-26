#!/bin/bash
pstree | grep nginx
pstree | grep redis
pstree | grep ssdb
pstree | grep mysql
pstree | grep postgres
pstree | grep php-fpm
pstree | grep java