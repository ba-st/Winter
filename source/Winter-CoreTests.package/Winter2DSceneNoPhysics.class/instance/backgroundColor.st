Accessing
backgroundColor
	^ backgroundColor ifNil: [ backgroundColor:= self class defaultBackgroundColor ]