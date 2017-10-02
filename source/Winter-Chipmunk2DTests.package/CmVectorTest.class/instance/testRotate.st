tests
testRotate
	| vector anotherVector rotatedVector |
	vector := CmVector x: 1.0 y: 2.0.
	anotherVector := CmVector x: 2.0 y: 2.0.
	rotatedVector := vector rotateBy: anotherVector.
	self
		assert: rotatedVector x equals: 2.0 negated;
		assert: rotatedVector y equals: 6.0