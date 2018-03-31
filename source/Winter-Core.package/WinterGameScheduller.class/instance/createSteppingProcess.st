initialization
createSteppingProcess

	^ (Process forContext: [ self stepAndWait ] asContext priority: Processor lowIOPriority)
		name: self name;
		yourself