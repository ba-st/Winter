private
primTransformVector: aVector angle: aFloat
	^ self ffiCall: #( void SetTransform(self, cpVect aVector, cpFloat aFloat) )