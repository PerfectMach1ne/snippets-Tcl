# https://wiki.tcl-lang.org/page/Tcl+Tutorial+Lesson+5

# Grouping arguments with []
# If a portion of the string is grouped with square brackets, then the string within the square brackets
# is evaluated as a command by the interpreter, and the result of the command replaces the square bracketed string.
proc selectsensor {} {
    return "SomeSensor"
}

proc readsensor {sensor} {
    puts "$sensor do the sensory thing"
}

puts [readsensor [selectsensor]]

# 1. The parser scans the entire command, and sees that there is a command substitution to perform: readsensor selectsensor
#    , which is sent to the interpreter for evaluation.
# 2. The parser once again finds a command to be evaluated and substituted, selectsensor
# 3. The fictitious selectsensor command is evaluated, and it presumably returns a sensor to read.
# 4. At this point, readsensor has a sensor to read, and the readsensor command is evaluated.
# 5. Finally, the value of readsensor is passed on back to the puts command, which prints the output to the screen.

# The exceptions to this rule are as follows:
# a) A square bracket that is escaped with a \ is considered as a literal square bracket.
# b) A square bracket within braces is not modified during the substitution phase.

set x abc
puts "A simple substitution $x\n"

set y [set x "def"]
puts "set returns new value of the var:"
puts "\tX: $x, Y: $y\n"

set z {[set x "string within quoted braces"]}
puts "Note curly braces: $z\n"

# set test z -> z
set test $z
puts $test

# experiemnting with eval (and simple error catchin example)
set b {the total is $20}
set a $b
puts $a
puts "-----------------"

puts -nonewline "1) "
puts [eval [list set a $b]]
puts -nonewline "2) "
puts [eval {set a $b}]
puts -nonewline "3) "
puts [catch {
    puts [eval "set a $b"]
} result] ;# catch returns 1 if an error was caught
# 0) words of the first command 'set a $b' are substituted before set is called into 'set a {the total is $20}
#    At this point set is called with args 'a' and 'the total is $20' and sets $a to aforementioned
# 1) Likewise in the 2nd command: 'eval [list set a $b]' -> 'eval {set a {the total is $20}}
#    and eval is called with script set a {the total is $20}
# 2) In the third command 'eval {set a $b}' there are no substitutions to perform, so the command remains unchanged.
#    and so eval reads the script and subsitutes $b: 'set a {the total is $20}'
# 3) FInally, in the last command we have an error: Tcl performs double quote substitutions,transforming the command to:
#    'eval {set a the total is $20}' then eval tries to evaluate 'set a the total is $20', failes to find $20 and
#    raises an error. ...that is caught. because I'm #smart

# https://stackoverflow.com/questions/43198502/error-handling-in-tcl
set code [catch {
    puts [eval "set a $b"]
} result]

if {$code == 0} {
    puts "Result was $result"
} elseif {$code == 1} {
    puts "Error happened with message: $result"
} else {
    puts "Code: $code\nResult: $result"
}

puts $tcl_version

if {[catch {puts [eval "set a $b"]} fid]} {
    puts stderr "Could not do a thing:\n$fid"
}

puts "-----------------"

set a "[set x {string within braces within quotes}]"
puts "see how the set is executed: $a"

set b "\[set y {this is a string within braceswithin quotes}]" ;# only one \ escape at the beginning is enough as you can see
puts "the \\ escapes the bracket and must be doubled to be a literal character in double quotes: $b"
puts "\$y is $y"

vwait forever