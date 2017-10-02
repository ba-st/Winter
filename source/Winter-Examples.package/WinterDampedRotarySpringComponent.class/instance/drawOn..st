drawing
drawOn: aCanvas
	| path stroke  delta pt anch1 anch2 aVectorPin bVectorPin |
		
	aVectorPin := bodya primPosition.
	bVectorPin := bodyb primPosition.
		
	"aVectorPin := ((constraint a primPosition) + (anch1 rotateBy: (constraint a primRotation))).
	bVectorPin := ((constraint b primPosition) + (anch2 rotateBy: (constraint b primRotation))).	" 
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
	