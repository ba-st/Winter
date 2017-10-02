tests
testConverting
	| boundingBox newBoundingBox |
	boundingBox := CmBoundingBox fromRectangle: (2.0 @ 2.0 extent: 5.0 @ 5.0).
	newBoundingBox := boundingBox asCmBoundingBox.
	self assert: newBoundingBox equals: boundingBox