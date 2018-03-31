rendering
renderOn: aCanvas translatedBy: aPoint 

	aCanvas pathTransform translateBy: aPoint.
	self renderOn: aCanvas.