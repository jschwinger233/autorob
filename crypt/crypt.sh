#! /usr/bin/expect 
set timeout -1
set filename [lindex $argv 0]
set password [lindex $argv 1]
spawn gpg -c "$filename"
expect "*Enter*"
send "$password\r"
expect {
    "*Repeat*" { send "$password\r" }
    "*re-enter*" { send "$password\r" }
}
expect {
    "*y/N*" { send "y\r" }
    eof { exit }
}
expect eof
exit
