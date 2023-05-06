# In Tcl, everything may be represented as a string, although internally it may be represented as a list,
# integer, double, or some other type, in order to make the language fast.
set fruit Cauliflower
# set always returns the contents of the variable named in the first argument
puts [set bread 123]
puts $fruit
puts $bread
# , arrays in Tcl are associative arrays.

set varName boob
# If varName consists only of alphanumeric characters, and no parentheses, it is a scalar variable.
# If varName has the form varName(index), it is a member of an associative array.

# The dollar sign tells Tcl to use the value of the variable -- in this case, X or Y.
set X "This be a stringy"

set Y 1.5749

puts $X
puts $Y

puts "-------------------------"

set label "The value of Y is: "
puts "$label $Y"

# ...
# ... LET'S DO SOMETHING CURSED
set set "twenywan"
puts $set ;# OH LORD IT WORKS

set puts puts
puts $puts ;# THIS WORKS AS WELL HEAAHHAAAHA
# It's beautiful. I've looked at this for fifty seven hours now.

# In Tcl, the evaluation of a command is done in 2 phases. The first phase is a single pass of substitutions.
# The second phase is the evaluation of the resulting command. Note that only one pass of substitutions is made.
# Thus in the command
puts $varName
# the contents of the variable varName are substituted for $varName, and then the command is executed. 
# puts $varName --> puts "boob"
set varName "12 boobs" 
puts "The current stock value is $varName"
set audibleBell "\a"
set octal "\021"
set unicodechar "\u0F9"
set hex "\xFC3"
puts "$octal $unicodechar $hex"
puts $octal
puts $unicodechar
puts $hex
puts $audibleBell

set Z Albany
set Z_LABEL "The capital of New York is: "

puts "$Z_LABEL $Z"   ;# Prints the value of Z
puts "$Z_LABEL \$Z"  ;# Prints literal $Z instead of the value of Z

puts "\nBen Franklin is on the \$100.00 bill"

set a 100.00
puts "Washington is not on the $a bill"    ;# Not what you want
puts "Lincoln is not on the $$a bill"      ;# This is OK
puts "Hamilton is not on the \$a bill"     ;# Not what you want either
puts "Ben Franklin is on the \$$a bill"    ;# But, this is OK

puts "\n................. examples of escape strings"
puts "Tab\tTab\tTab"
puts "This string prints out \non two lines"
puts "This string comes out\
on a single line"

# By contrast, grouping words within braces disables substitution.
set Z Albany
set Z_LABEL "The Capitol of New York is: "

puts "\n.............. examples of differences between  \" and \{"
puts "$Z_LABEL $Z"
puts {$Z_LABEL $Z}

puts "\n....... examples of differences in nesting \{ and \" "
puts "$Z_LABEL {$Z}"
puts {Who said, "What this country needs is a good $0.05 cigar!"?}

puts "\n.............. examples of escape strings"
puts {Note: no substitutions done within braces \n \r \x0a \f \v}
puts {But:
The escaped newline at the end of a\
string is replaced by a space}

vwait forever ;# This makes the program run, well, forever. Till it's manually stopped in some way.
# A cheap, convenient while(true), if you may.
# double quotes and braces cause different behavior during the substitution phase. 
