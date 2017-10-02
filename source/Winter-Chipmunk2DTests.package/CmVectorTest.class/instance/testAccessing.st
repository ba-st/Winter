tests
testAccessing
	| vector |
	vector := CmVector x: 1.0 y: 2.0.
	self
		assert: vector x equals: 1.0;
		assert: vector y equals: 2.0.
	vector x: 2.0 ; y: 1.0.
	self
		assert: vector x equals: 2.0;
		assert: vector y equals: 1.0.
	