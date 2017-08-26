accessing
backgroundColor
	^backgroundColor ifNil: [ backgroundColor := self class defaultBackgroundColor ]