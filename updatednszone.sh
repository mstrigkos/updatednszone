#!/bin/bash
#
# This bash script changes an A record for a specific subdomain on your DNS Zone
#
# MIT License
#
# Copyright (c) 2019 Michael Strigkos - mstrigkos@gmail.com
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

DOMAIN=$1
SUBDOMAIN=$2
IP=$3
FILE="/var/named/$1.db"
if [ -f $FILE ]; then
	if grep -q $SUBDOMAIN "$FILE"; then
		echo "Changing IP"
		sed -i "s/$2.*/$2		14400	IN	A	$IP/" /var/named/$1.db
		echo "Bind changes"
		rndc reload
		echo "Reload named"
		service named reload
	else
		echo "Subdomain does not seem to exist in DNS Zome for $DOMAIN"
	fi
else
	echo "Domain $DOMAIN does not seem to have a DNS Zone"
fi
echo "Finished"
