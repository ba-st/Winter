private
primCpBoxNew: body boundingBox: box radius: radius
	^ self ffiCall: #( cpShape* cpBoxShapeNew2(cpBody *body, cpBB box, cpFloat radius) )