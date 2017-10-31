events
handleCollision: aCollision

	^collisionHandlers
		detect: [ :each | each canHandle: aCollision ]
		ifFound: [ :handler | handler value: aCollision ]
		ifNone: [ "Por el momento nada" ]