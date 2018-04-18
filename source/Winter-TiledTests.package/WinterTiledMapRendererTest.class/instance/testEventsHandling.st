tests
testEventsHandling
	| renderer eventUpdate |
	eventUpdate := WinterSceneUpdatedEvent new.
	renderer := WinterTiledMapRenderer of: map.
	map addLayer: self layer.
	self
		assert: (eventUpdate additionalInfoAt: #unitScale) isNil;
		deny: receivedUpdateEvent.
	eventUpdate execute: renderer.
	self
		assert: (eventUpdate additionalInfoAt: #unitScale) equals: 1.0;
		assert: receivedUpdateEvent