accessing
expectedNumberOfPlayers
	"See class comment"
	| max |
	max := 0.
	cellDescriptors do: [ :column |
		column do: [ :descr | 
			max := max max: descr ] ].
	^ max - 1