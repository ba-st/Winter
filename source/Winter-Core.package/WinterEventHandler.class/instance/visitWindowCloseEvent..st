as yet unclassified
visitWindowCloseEvent: anEvent
	self terminateProcesses.
	
	Smalltalk snapshot: false andQuit: true
	