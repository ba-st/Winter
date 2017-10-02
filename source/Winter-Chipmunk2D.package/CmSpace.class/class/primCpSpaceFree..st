private
primCpSpaceFree: handle
	self ffiCall: #( void cpSpaceFree(cpSpace *handle) )
