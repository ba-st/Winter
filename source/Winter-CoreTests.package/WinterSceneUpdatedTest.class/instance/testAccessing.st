tests
testAccessing
	
	| event |
	
	event := WinterSceneUpdatedEvent  scene: self scene.
	
	self
		assert: event scene equals: self scene;
		assert: event canvas isNil.
	
	event
		scene: nil;
		canvas: self canvas.
	
	self
		assert: event scene isNil;
		assert: event canvas equals: self canvas