stepping
stepWithSurface: aSurface
	process := [ 
		[ true ] whileTrue: [ 
			self drawWithSurface: aSurface. 
	  	 	self delay wait ] ] newProcess.
	
	process priority: Processor highIOPriority.
	process name: 'Athens Painter'.

	process resume