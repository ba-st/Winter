accessing
delayTime
	^delayTime ifNil: [
		delayTime := Delay forMilliseconds: (1000 / self game stepTime) rounded ]