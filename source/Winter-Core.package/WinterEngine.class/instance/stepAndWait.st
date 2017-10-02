private
stepAndWait
	[ self isStepping ] whileTrue: [ 
		self step.
	 	self wait ].