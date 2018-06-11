accessing
bestCharacterAt: i
	"Set of good looking wizard style characters"
	| indexes |
	indexes := #(
	#(1 288 0)
	#(5 0 0)
	#(9 0 192)
	#(9 288 0)
	) at: i.
	^ self new
		fileName: 'perso' , indexes first printString;
		position: indexes second @ indexes third;
		yourself