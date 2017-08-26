private
primSpace
	^ self indirectCall: #( cpSpace * cpBodyGetSpace(self) )
	