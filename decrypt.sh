#! /usr/bin/expect 
set timeout -1
set filename [lindex $argv 0]
set password [lindex $argv 1]
spawn gpg "$filename"
expect "*Enter*"
send "$password\r"
expect eof
exit
