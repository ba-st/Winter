private
primCpBodyFree: handle
	self ffiCall: #(void cpBodyFree(cpBody* handle))
