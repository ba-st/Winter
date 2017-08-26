private
createSteppingProcess
	^(Process 
		forContext: [ self stepAndWait ] asContext
		priority: Processor lowIOPriority)
		name: 'Storm Stepping Process';
		yourself