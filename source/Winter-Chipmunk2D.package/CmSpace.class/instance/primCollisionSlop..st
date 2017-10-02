private
primCollisionSlop: aFloat

	^self ffiCall: #(void
cpSpaceSetCollisionSlop(self, cpFloat aFloat))