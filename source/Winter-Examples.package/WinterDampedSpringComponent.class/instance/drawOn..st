drawing
drawOn: aCanvas
	| path stroke  delta pt anch1 anch2 aVectorPin bVectorPin |
		
		
	aVectorPin := ((constraint a position) + (anch1 rotateBy: (constraint a rotation))).
	bVectorPin := ((constraint b position) + (anch2 rotateBy: (constraint b rotation))).	
	delta := aVectorPin - bVectorPin.
	
	pt := aCanvas pathTransform.
	
	path := self getSpringShape: aCanvas.
	
	aCanvas setPaint: Color white.
	stroke := aCanvas setStrokePaint: Color white.
	stroke width: 2.
	
	pt restoreAfter:[
		pt scaleBy: delta asPoint.
		pt  translateBy: aVectorPin asPoint; 
			 rotateByRadians: (Float pi/4) negated.
		aCanvas drawShape: path.
	].
		
	
	
	
		

	"aCanvas drawShape: path."
	