#! /bin/env tclsh

#  Tcl comment. also this below is for making wish open up a command window
#  ... but it seems to not work, so just use tclsh for heavily command line based stuff I guess
#  A Tcl script is nothing more than a sequence of Tcl commands.
catch {console show}

puts "\"what do you do for a living?\" umm i'm a silly girl ? lol"

set greeting hello
puts $greeting

set adressee world
puts "$greeting, $adressee"

set test "hello"
puts $test
puts "$test"
puts "$greeting $adressee!!!"

#  a risky silly little test:
#  as you can also see, ;'s are possible to use but not required. like in Kotlin <3.
#  and unlike in Python or Java. pesky ass languages
set a 5;
puts $a;

set b 7
puts $b

puts $a$b
#  comment note: you cannot do this:
#  puts $a$b #  comment here woooooooo
#  It passed my eyes somewhere that comments are kinda like commands?
#  So they must be a single line thing

