private
primCpBoxNew: body width: width height: height
	^ self ffiCall: #( cpShape* cpBoxShapeNew(cpBody *body, cpFloat width, cpFloat height) )