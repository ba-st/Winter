Accessing
delayTime

	^ delayTime
		ifNil: [ delayTime := Delay forMilliseconds: (1000 / managedObject stepTime) rounded ]