#!/bin/bash

/aesmd.sh

gramine-sgx-get-token --output app.token --sig app.sig
gramine-sgx app
# cd /app
# gramine-sgx /usr/bin/python3 manage.py runserver 0.0.0.0:8000