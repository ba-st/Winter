Tests
testConverting
	| sprite  |
	sprite := WinterSprite fromPath: 'pharo.png' named: 'pharo'.

	self
		assert: sprite extent equals: (512@512).
		
	sprite scaledToSize: 40@40.
	
self
		assert: sprite extent equals: (40@40).