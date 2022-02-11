#!/bin/bash

# remove windows carrige return character
sed -i -e 's/\r$//' init.sh
sed -i -e 's/\r$//' build.sh
sed -i -e 's/\r$//' publish.sh
