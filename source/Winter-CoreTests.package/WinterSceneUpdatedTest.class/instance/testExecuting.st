tests
testExecuting
	
	| event |
	
	event := WinterSceneUpdated scene: self scene.
	
	self
		deny: receivedEvent.
	
	event execute: self component.
	
	self
		assert: receivedEvent.