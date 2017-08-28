private
primCpCircleShapeNew: body radius: radius offset: offset
	^ self ffiCall: #(
		cpShape* cpCircleShapeNew(
			cpBody *body,
			cpFloat radius,
			cpVect offset) )