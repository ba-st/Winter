Flipping
flipY: aBoolean

	aBoolean
		ifTrue: [ | temporal |
			temporal := v.
			v := v2.
			v2 := temporal ]
		ifFalse: [ "Do nothing" ]