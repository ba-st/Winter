initialization
initialize
	super initialize.
	process := (Process 
		forContext: [ self batchLoop ] asContext
		priority: Processor highestPriority)
		name: 'Storm Batch Process';
		yourself