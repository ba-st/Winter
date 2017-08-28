collision
addCollisionHandlerBetween: typeA and: typeB 
	^ self ffiCall: #(void cpSpaceAddCollisionHandler(cpSpace self,cpCollisionType typeA, cpCollisionType typeB))