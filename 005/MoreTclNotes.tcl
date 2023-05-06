puts "Hello, World!"
set peep "boop"
puts peep
puts $peep
puts bread123 ;# apostrophed comment (can be placed anywhere)

#  puts beh #  this line plops out an erorr
# this is a normal comment 
puts beh; # now this is fine too

puts "Hello, World - In quotes"    ;# Note: comment after a command.
# This is a comment at beginning of a line
puts {Hello, World - In Braces}
puts "This is line 1"; puts "this is line 2"
puts "Hello, World; - With  a semicolon inside the quotes"
# Words don't need to be quoted unless they contain white space:
puts HelloWorld

puts -nonewline "brah"
puts ".mp4"
puts -nonewline {brah}
puts {.mp4}
puts -nonewline brah
puts .mp4
#  Print a message to the standard error channel:
puts stderr "Starr was here"
# Append a log message to a file:
set chan [open mylog.txt a]
set timestamp [clock format [clock seconds]]
puts $chan "$timestamp - Heelooo, woorld!!!!"
close $chan
# On file creation, it just creates an enmpty file
# On second run, the first log message appeared
# On second run, the second log message was appended.

# https://stackoverflow.com/questions/42254837/exec-cmd-commands-using-tcl-without-opening-terminal-window
# Now, how do exec non-Tcl commands or apps in Tcl?
# someone tried this:
set res [exec cmd.exe /c "dir" &] ;# ...but the & at the end indicates that the command will be processed in the background
puts "test"
# the result returned is the process id of the command
# Finally, two correct ways to do the thing:
set res [exec cmd.exe /c "dir"]
# Alternatively, and more efficiently and resource-economically:
set res [glob *.txt] ;# use in-built glob to search for all text files
puts $res
set res [glob -directory {D:/Programming/uni-se-prj/vCalendar-frontend/src} *.vue] ;# Look for all .vue files in specified diretory
puts $res
set res [glob *] ;# fIND everything in current dir
puts $res
puts "test if we even got to this point"
set res [glob -tails -directory {D:/Programming/uni-se-prj/vCalendar-frontend/src} *.vue]
puts $res
# glob -nocomplain allows an empty list to be returned without an error. this is important, because glob can halt hte program by throwing an error
# if it finds nothing. so:
set res [glob -nocomplain -tails -directory {D:/} *.sys] ;# ... also apparently -nocomplain has to be the first option
puts $res
puts "you will see this if we survived a potential uncontained glob error"
