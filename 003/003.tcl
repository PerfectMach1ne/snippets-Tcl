

#  Almost every Tcl command returns a value, For example the set command returns the value assigned to the variable.
#  Command substitution
set a 5
puts [set a]
#  Variable substitution

# equivalent
puts [set a]
puts $a

set a 4
set b fdkgrajvefgfsg
puts "Hello $a world \n\t[string length $b]"
# Everything between {} is a singular unique argument where no substitutions are performed.
puts {Hello $a world}

# Everything is a command
set a 57
if $a {
    puts HELOOOO!!!!
}
if $c {
    puts "let's see if this runs"
}

# Everything is a string
set aa pu
set bb ts
$aa$bb "helooow oorolll";
# this does not work, though?
# ...but in tclsh it does

set d pu
set e ts
$d$e "Hello World"
