private
primPosition: vector

	^ self ffiCall: #( void cpBodySetPosition( self, cpVect vector ) )
