collision
removeCollisionHandlerBetween: typeA and: typeB
	^ self ffiCall: #(void cpSpaceRemoveCollisionHandler(
			cpSpace self,
			cpCollisionType typeA,
			cpCollisionType typeB
		))