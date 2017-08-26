drawing
getSpringShape: aCanvas
	| path stroke  delta pt |
	
	^aCanvas createPath: [ :builder |
		builder absolute.
		{0.0@0.0.
		0.20@0.0.
		0.25@3.0.
		0.30@(-6.0).
		0.35@6.0.
		0.40@(-6.0).
		0.45@6.0.
		0.50@(-6.0).
		0.55@6.0.
		0.60@(-6.0).
		0.65@6.0.
		0.70@(-3.0).
		0.75@6.0.
		0.80@0.0.
		1.00@0.0.
	} do: [:each | builder perform: #lineTo: with: each ]
		
].
	