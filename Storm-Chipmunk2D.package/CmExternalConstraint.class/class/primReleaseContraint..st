finalization
primReleaseContraint: handle
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	self nbCall: #(void cpConstraintFree(ulong handle))
