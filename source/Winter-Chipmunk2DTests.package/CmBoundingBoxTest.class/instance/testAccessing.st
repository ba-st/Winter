tests
testAccessing
	| boundingBox |
	boundingBox := CmBoundingBox fromRectangle: (2.0 @ 2.0 extent: 5.0 @ 5.0).
	self
		assert: boundingBox t equals: 2.0;
		assert: boundingBox b equals: 7.0;
		assert: boundingBox l equals: 2.0;
		assert: boundingBox r equals: 7.0