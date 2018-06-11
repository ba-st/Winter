as yet unclassified
defaultKeyboardCodes
	"Each array represent the key codes for a player in this specific order:
	down left right up castSpell"

	"^ Array
		with:
			(Array
				with: Character arrowUp
				with: Character arrowLeft
				with: Character arrowDown
				with: Character arrowRight
				with: Character tab)
		with: #($w $a $s $d $q)
		with: #($f $g $t $h $r)
		with: #($j $i $k $l $u)"
		
		^ #(
		#(81 80 79 82 229) "arrows and shift"
		#(22 4 7 26 20) "wasd and q"
		#(10 9 11 23 21) "fgth and r"
		#(14 13 15 12 24) "jikl and u"
		)