Accessing
eventHandlerFor: aWinterScreen

	^ WinterKeyboardEventHandler new
		screenModel: self;
		yourself