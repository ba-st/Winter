instance creation
on: aBlock
	^ self
		signature: #(void (cpArbiter *arbiter, cpSpace space, void *data))
		block: aBlock