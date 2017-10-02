accessing
balls
	^ balls ifNil: [ balls := self class defaultBalls ]