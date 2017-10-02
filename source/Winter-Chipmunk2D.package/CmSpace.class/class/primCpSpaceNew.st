private
primCpSpaceNew
	^ self ffiCall: #( cpSpace* cpSpaceNew() )