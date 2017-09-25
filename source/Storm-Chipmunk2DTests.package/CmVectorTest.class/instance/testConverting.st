tests
testConverting
	| vector convertedVector |
	vector := CmVector x: 1.0 y: 2.0.
	convertedVector := vector asCmVector.
	self assert: convertedVector equals: vector.
	convertedVector := vector asPoint.
	self assert: convertedVector equals: 1.0 @ 2.0