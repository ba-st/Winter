private
primCpBoxNew: body boundingBox: box 
	^ self ffiCall: #( cpShape* cpBoxShapeNew2(cpBody *body, cpBB box) )