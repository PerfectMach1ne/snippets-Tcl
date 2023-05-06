#! /bin/env tclsh

# https://learnxinyminutes.com/docs/tcl/
# wow so cool:
    #
    #Convenient cross-platform networking API
    #
    #Fully virtualized filesystem
    #
    #Stackable I/O channels
    #
    #Asynchronous to the core
    #
    #Full coroutines
    #
    #A threading model recognized as robust and easy to use
# anyway

######################## section 1 - guidelines
# Tcl is not Sh or C!
# Braces are a quoting mechanism, not syntax for the construction of code
# blocks or lists. Tcl doesn't have either of those things.
# Braces are used to escape special characters, which makes them well-suited for quoting procedure
# bodies and strings that should be interpreted as lists.
######################## section 2 - syntax
# A script is made up of commands delimited by newlines or semicolons.
# Each command is a call to a routine.
# The first word is the name of a routine to call, and subsequent words are arguments to the routine.
# Words are delimited by whitespace. Since each argument is a word in the command it is already a string, and may be unquoted:
set part1 Sal
set part2 ut; set part3 ations
puts "$part1$part2$part3"
set greeting $part1$part2$part3
puts $greeting
# When "set" is given only the name of a variable, it returns the
# value of that variable:
puts "test1"
# they put crappy errored code on that website:
    #set part3 ;# Returns the value of the variable.
    # When "set" is given only the name of a variable, it returns the
    # value of that variable:
    #puts[set part3] ;# ? ok what
# yeah the above also don't work

puts "test2"

puts $part1$part2[set part3] ;# but this is fine
# An embedded script may be composed of multiple commands, the last of which provides
# the result for the substitution:
#puts $greeting$i ;# errorrrrr
set greeting $greeting[
    incr i
    incr i
    incr i
]
puts $greeting ;# -> Salutations3
puts $greeting$i
