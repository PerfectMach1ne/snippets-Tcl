# The Tcl command for doing mathematical calculations is expr.
# expr takes all of its arguments ("2 + 2" for example) and evaluates the result as a Tcl "expression" (rather than a normal command), and returns value
# The operators permitted in Tcl expressions include all the standard math functions, logical operators, bitwise operators,
# as well as math functions like rand(), sqrt(), cosh() and so on
# Expressions almost always yield numeric results (integer or floating-point values).
# Floating-point numbers may be specified in any of the ways accepted by an ANSI-compliant C compiler.
set a 2.1
set b 3.
set c 6E4
set d 7.91e+16
set e .000001

puts "$a\n$b\n$c\n$d\n$e"
# If no numeric interpretation is possible, then an operand is left as a string (and only a limited set of operators may be applied to it)
# but literal strings must be enclosed in double quotes.
set number 2,1
expr {$number > 2} ;# True, because the string "2,1"
                    # alphabetically (!) comes after "2"

expr {$number > 2.0}  ;# False, because the string "2,1"
                       # alphabetically comes before "2.0"

if {$number > 2.0} {
    puts "this won't print"
} elseif {$number > 2} {
    puts "but this wil"
}

# It is possible to deal with numbers in that form, but you will have to convert these "strings" to numbers in the standard form first.

#Operands may be specified in any of the following ways:
#
#    As a numeric value, either integer or floating-point.
#    As strings enclosed in double quotes.
#    As a boolean (logical) value in one of the following forms: 1 or 0, true or false, yes or no, on or off.
#    As a Tcl variable, using standard $ notation. The variable's value will be used as the operand

set x 1
puts [expr { $x>0? ($x+1) : ($x-1) }]
puts [expr {3 ** 2}] ;# expoentiation

# When applied to integers, the division and remainder operators can be considered to partition the number
# line into a sequence of equal-sized adjacent non-overlapping pieces where each piece is the size of the divisor;
# the division result identifies which piece the divisor lay within, and the remainder result identifies
# where within that piece the divisor lay. A consequence of this is that the result of -57 / 10 is always -6, and the result of -57 % 10 is always 3

puts [expr {"a" eq "a"}] ;# 1 == true
puts [expr {"a" ne "A"}] ;# 1 == true
puts [expr {"a" in "aaaa"}] ;# is "a" in list "aaaa"?
puts [expr {"bbbbb" ni "cccc"}] ;# the reverse
puts [expr {"9" == "9.0"}] ;# Operands can be interpreted as numbers
puts [expr {"9" eq "9.0"}]

puts [expr { $x % 2 ? "Odd" : "Even"}]
set y 3
puts [expr { $x > 1 || ($x < 2 && $y == 3) }]
puts [expr {3+4*5}]
puts [expr {(3+4)*5}]

set w "Abcdef"
puts [expr { [string length $w] -2*$x }] ;# 6 - 2*1 -> 4
puts [expr { ([string length $w]*-2)*$x }] ;# -12
puts [expr { tanh(0.5) }]
puts [expr { ceil(4.3) }]
package require math::constants ;# import the math::constants package
::math::constants::constants e ;# launch the constants procedure that imports specific constants
puts [expr { log($e) }]
puts [expr { log(10) }]

puts [expr {sqrt(4)}]
::tcl::mathfunc::sqrt 4 ;# idk 
# but in tclsh console it'll work
puts [::tcl::mathfunc::sqrt 4] ;# good

# Type conversions
# double() converts a number to a double-precision floating-point number.
# int() converts a number to an ordinary integer number (by truncating the decimal part).
# wide() converts a number to a so-called wide integer number (these numbers have a larger range).
# entier() coerces a number to an integer of appropriate size to hold it without truncation.
#   This might return the same as int() or wide() or an integer of arbitrary size (in Tcl 8.5 and above).
set X 100
set Y 256
set Z [expr {$Y + $X}]
set Z_LABEL "$Y plus $X is "
puts "$Z_LABEL$Z"

puts "[expr {-3 * 4 + 5}]"
puts "[expr {(5 + -3) * 4}]"

#
# The trigonometric functions work with radians ...
#
set pi6 [expr {3.1415926/6.0}]
puts "Sine and cosine of pi/6: [expr {sin($pi6)}] [expr {cos($pi6)}]"

# workin with arrays
# ... well i dont think those work
#set a(1) 547
#set a(2) 597
#set a(3) 57
#set bb 2
#puts $a($bb)
#puts "Sum: [expr {$a(1)-$a($bb)}]"
#puts "Sum: [expr {$a(1)+$a(2)}]"
puts [expr {$a(1)}]