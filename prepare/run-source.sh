#!/bin/bash
set -e
echo "Preparing environment.."

. /tools/.variables

# download toolchain
sh /tools/3.1-download-tools.sh
