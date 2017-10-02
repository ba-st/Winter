private
primIteration: anInteger

	^self ffiCall: #(void
cpSpaceSetIterations(self, int anInteger))