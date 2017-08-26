drawing
drawOn: aCanvas
	| path stroke  |
	
	path := aCanvas createPath: [ :builder | | anch1 anch2 aVectorPin bVectorPin halfPi  r rn |
		anch1 := constraint anchr1.
		anch2 := constraint anchr2.
		halfPi := Float halfPi.
		r := 2.5.
		rn := r negated.
		
		aVectorPin := ((constraint a position) + (anch1 rotateBy: (constraint a rotation))).
		bVectorPin := ((constraint b position) + (anch2 rotateBy: (constraint b rotation))).
		" 		builder absolute.
		builder moveTo: aVectorPin asPoint.
		builder lineTo: bVectorPin asPoint."
		
	
				builder absolute.
				builder moveTo: aVectorPin asPoint - (r@0).
				builder
					relative;
					cwArcTo: r@rn angle: halfPi;
					cwArcTo: r@r angle: halfPi;
					cwArcTo: rn@r angle: halfPi;
					cwArcTo: rn@rn angle: halfPi.
				builder absolute.
				builder moveTo: aVectorPin asPoint.
				builder lineTo: bVectorPin asPoint.	
				builder 					relative;  moveTo: (r negated @0).
				builder
					cwArcTo: r@rn angle: halfPi;
					cwArcTo: r@r angle: halfPi;
					cwArcTo: rn@r angle: halfPi;
					cwArcTo: rn@rn angle: halfPi.
	
	
].
		
	aCanvas setPaint: Color white.
	
	stroke := aCanvas setStrokePaint: Color white.

	stroke width: 2.
	aCanvas drawShape: path.
	