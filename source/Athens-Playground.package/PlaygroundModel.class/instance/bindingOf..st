private
bindingOf: aString 
	attributeBindings 
		at: aString
		ifAbsentPut: nil.
	^ attributeBindings associationAt: aString