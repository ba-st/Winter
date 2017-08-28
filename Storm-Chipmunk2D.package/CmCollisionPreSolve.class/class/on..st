instance creation
on: booleanBlock
	^ self
		signature: #(cpBool (cpArbiter *arbiter, cpSpace space, void *data))
		block: booleanBlock