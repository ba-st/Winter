private
primCpSegmentNew: body from: a to: b radius: radius
	^ self ffiCall: #( cpShape* cpSegmentShapeNew(
			cpBody *body,
			cpVect a,
			cpVect b,
			cpFloat radius ) )	