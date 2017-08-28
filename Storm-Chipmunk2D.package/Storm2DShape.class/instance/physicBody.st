accessing
physicBody
	^physicBody ifNil: [ physicBody := self createPhysicBody ]