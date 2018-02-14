Flipping
flipX: aBoolean

	aBoolean
		ifTrue: [ | temporal |
			temporal := u.
			u := u2.
			u2 := temporal ]
		ifFalse: [ "Do nothing" ]