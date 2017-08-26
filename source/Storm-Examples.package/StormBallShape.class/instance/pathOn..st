drawing
pathOn: aCanvas
	^graphicsPath ifNil: [
		graphicsPath :=  
			aCanvas createPath: [ :builder | 
				| r rNeg halfPi |
			
				r := self radius.
				rNeg := r negated.
				halfPi := Float halfPi.

				builder
					relative;
					moveTo: 0 @  r;
					cwArcTo: r @ rNeg angle: halfPi;
					cwArcTo: r @ r angle: halfPi;
					cwArcTo: rNeg @ r angle: halfPi;
					cwArcTo: rNeg @ rNeg angle: halfPi ] ].