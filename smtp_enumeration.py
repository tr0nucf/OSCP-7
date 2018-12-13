#!/usr/bin/env python
#By anakein
import sys
import socket


if len(sys.argv) != 2:
    print("[+] Usage: vrfy.py <username>")
    sys.exit(0)

# Create a Socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect to the Server
connect = s.connect(('192.168.0.11', 25))

# Receive the banner
banner = s.recv(1024)
print(banner)

# VRFY a user
s.send('VRFY ' + sys.argv[1] + '\r\n')
results = s.recv(1024)
print(results)

# Close the socket
s.close()
