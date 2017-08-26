collision
addCollisionHandlerBetween: typeA and: typeB begin: begin preSolve: preSolve postSolve: postSolve separate: separate data: data
	^ self ffiCall: #(void cpSpaceAddCollisionHandler(
			cpSpace self,
			cpCollisionType typeA, cpCollisionType typeB,
			cpCollisionBeginFunc begin,
			cpCollisionPreSolveFunc preSolve,
			cpCollisionPostSolveFunc postSolve,
			cpCollisionSeparateFunc separate,
			void *data
		))