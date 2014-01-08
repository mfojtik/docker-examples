#!/bin/bash -e

docker pull fedora

pushd mariadb/ &>/dev/null
docker build -t mfojtik:mariadb -rm .
popd >/dev/null

pushd httpd/ &>/dev/null
docker build -t mfojtik:httpd -rm .
popd >/dev/null

docker run mfojtik:mariadb -name mariadb
docker run -link mariadb:db -name webapp mfojtik:httpd
