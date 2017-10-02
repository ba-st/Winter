type mapping
ffiBindingOf: aTypeName
	^ TypeMap at: aTypeName ifAbsent: [ super ffiBindingOf: aTypeName ]