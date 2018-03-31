rendering
renderOn: aCanvas temporarilyTranslatedBy: aPoint 

	aCanvas pathTransform translateBy: aPoint.
	self renderOn: aCanvas.
	aCanvas pathTransform translateBy: aPoint negated.