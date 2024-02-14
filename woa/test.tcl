set funnynumberlist {{57} {-57} {5} {3} {420} {69} {667} {333} {21}}

proc dostuff {arrrray} {
  return [set newlist [ list "[lindex $arrrray 0]" "[lindex $arrrray 1]" ] ]
  # JAVA CAN'T DO THIS. Tcl IS 10 YEARS OLD. I' M GOING TO GO INSANE AHAHAHAHAHAHGHFHFUHGK
}

foreach num [dostuff $funnynumberlist] {
  puts $num
}	

set set set
puts $set
set puts puts
puts $puts
