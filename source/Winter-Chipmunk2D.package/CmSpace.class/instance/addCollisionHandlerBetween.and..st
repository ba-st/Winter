collision
addCollisionHandlerBetween: typeA and: typeB 
	^ self ffiCall: #(void cpSpaceAddCollisionHandler( self,cpCollisionType typeA, cpCollisionType typeB))