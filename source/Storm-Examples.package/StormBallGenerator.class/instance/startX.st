accessing
startX
	^startX ifNil: [ startX := self class defaultStartX ]