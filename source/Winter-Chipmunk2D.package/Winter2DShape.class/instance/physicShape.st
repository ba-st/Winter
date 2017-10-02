accessing
physicShape
	^physicShape ifNil: [ physicShape := self createPhysicShape ]