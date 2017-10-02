arrayed access
arrayClass
	^ arrayClass ifNil: [ arrayClass := FFIExternalArray ofType: self name asString]