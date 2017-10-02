collision
setDefaultCollisionBegin: begin preSolve: preSolve postSolve: postSolve separate: separate data: data
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^ self nbCall: #(void cpSpaceSetDefaultCollisionHandler(
			self,
			cpCollisionBeginFunc begin,
			cpCollisionPreSolveFunc preSolve,
			cpCollisionPostSolveFunc postSolve,
			cpCollisionSeparateFunc separate,
			void *data
))