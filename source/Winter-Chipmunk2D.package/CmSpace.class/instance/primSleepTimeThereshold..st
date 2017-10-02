private
primSleepTimeThereshold: aFloat

	^self ffiCall: #(void
cpSpaceSetSleepTimeThreshold(self, cpFloat aFloat))