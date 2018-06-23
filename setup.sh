#!/usr/bin/env bash

# server
touch disk_file
openssl req -x509 -newkey rsa:4096 -keyout server_key.pem -out server_cert.pem -days 365 -nodes -subj '/CN=localhost'

# client
openssl req -x509 -newkey rsa:4096 -keyout client_key.pem -out client_cert.pem -days 365 -nodes -subj '/CN=localhost'
