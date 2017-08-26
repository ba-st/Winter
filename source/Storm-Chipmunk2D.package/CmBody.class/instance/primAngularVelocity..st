private
primAngularVelocity: velocity
	^ self indirectCall: #( void cpBodySetAngularVelocity(self, cpFloat velocity) )
