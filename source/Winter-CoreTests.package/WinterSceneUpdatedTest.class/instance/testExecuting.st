tests
testExecuting
	
	| event |
	
	event := WinterSceneUpdatedEvent scene: self scene.
	
	self
		deny: receivedEvent.
	
	event execute: self component.
	
	self
		assert: receivedEvent.