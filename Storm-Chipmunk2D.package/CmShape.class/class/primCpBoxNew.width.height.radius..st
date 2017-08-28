private
primCpBoxNew: body width: width height: height radius: radius
	^ self ffiCall: #( cpShape* cpBoxShapeNew(cpBody *body, cpFloat width, cpFloat height,cpFloat radius) )