testing
isSleeping
	^ self indirectCall: #( cpBool cpBodyIsSleeping(self) )