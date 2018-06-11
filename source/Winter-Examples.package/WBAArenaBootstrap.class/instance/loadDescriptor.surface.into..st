as yet unclassified
loadDescriptor: descr surface: surface into: class
	^ class new 
		sprites: (descr loadSpritesWith: surface);
		scheduler: startGame scheduler;
		yourself 