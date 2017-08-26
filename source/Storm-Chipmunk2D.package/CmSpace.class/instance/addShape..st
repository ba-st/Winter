accessing
addShape: shape
	^ self ffiCall: #( cpShape* cpSpaceAddShape(self, cpShape *shape) )