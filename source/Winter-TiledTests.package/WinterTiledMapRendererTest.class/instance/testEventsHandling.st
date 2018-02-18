tests
testEventsHandling

	| renderer eventUpdate eventActivate |

	eventUpdate := WinterSceneUpdated new.
	eventActivate := WinterSceneActivated new.
	renderer := WinterTiledMapRenderer of: map.
	map addLayer: self layer.
	
	self
		assert: (eventUpdate additionalInfoAt: #unitScale) isNil;
		assert: (eventActivate additionalInfoAt: #unitScale) isNil;
		deny: receivedUpdateEvent;
		deny: receivedActivateEvent.
		
	eventUpdate execute: renderer .
	eventActivate execute: renderer .
	
self
		assert: (eventUpdate additionalInfoAt: #unitScale) equals: 1.0;
		assert: (eventActivate additionalInfoAt: #unitScale) equals: 1.0;
		assert: receivedUpdateEvent;
		assert: receivedActivateEvent.