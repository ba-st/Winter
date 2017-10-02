private
primAngularVelocity: velocity
	^ self ffiCall:  #( void cpBodySetAngularVelocity(self, cpFloat velocity) )
