tests
testExecuting
	
	| event |
	
	event := WinterSceneActivated scene: self scene.
	
	self
		deny: receivedEvent.
	event execute: self component.
	self
		assert: receivedEvent.