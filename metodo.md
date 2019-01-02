Exam Tips:

As with everything, there are always certain things that you should know and be doing during the PWK Lab and OSCP Exam, these following tips should help you stay on focus and to stray away from rabbit holes.

    Enumerate, Enumerate, Enumerate!
    Simple Nmap Scans w/ Script Scanning are your friends!
        ```TCP: nmap -sS -sV -sC -n [IP]```
        ```UDP: nmap -sU -sV -n --top-ports 200 [IP]```
    Enumerate SNMP (UDP 161) if it’s open!
        snmp-check -t [IP] -c public
        This will show other open ports/running services and applications!
    Enumerate SMB (TCP 139/TCP 445) if it’s open!
        enum4linux [IP]
        This will show open shares, anonymous logins, etc.
    Run nikto on interesting directories!
        nikto -h http(s)://[IP]:[PORT]/[DIRECTORY]
    DirBuster over dirb. Opt for using the medium wordlist for better results!
        /usr/share/dirbuster/wordlists/directory-list-2.3-medium.txt
    Check for anonymous logins for FTP/SMB!
        ftp [IP]
            Username: anonymous Password: anonymous
        smbclient -L \\[IP]
            Username: root Password: None
    Check for WebDav! Nmap script scan should pick it up! If not…
        davtest -url http(s)://[IP]
    Don’t overthink it! Try low hanging fruit first!
        Password the same as Username?
        Username/Password combo of admin:admin?
        Google the Documentation. Default Credentials/Login?
    Rotate machines every 3-4 hours. Don’t tire yourself out!
    Have an idea? But it seem impossible? Try it… you never know! =)
    Take frequent breaks. Opt for 10 minute break every 2 hours.
    Eat and drink! Make time for Lunch, and Dinner. Your brain needs food to function.
    Limit caffeine intake, 1-2 cups of coffee is okay! But, drink Tea and Water.
    Don’t have any snacks next to you. If you’re hungry, walk to the kitchen for a snack, this will make you walk away from your PC and will help clear your mind.
    Breath… relax… you got 24 hours!
    Organize your notes, take screenshots, and document everything!
    A few days before the exam create and edit your report outline.
    In the PWK Lab, practice the Buffer Overflows till you can do them by heart and without notes.
    Don’t give up to easily, and most importantly… “Try Harder!”.
