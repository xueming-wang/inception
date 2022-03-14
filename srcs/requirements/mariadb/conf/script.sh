#!/bin/bash

service mysql start 
cat ./setup.sql | mysql

sleep infinity