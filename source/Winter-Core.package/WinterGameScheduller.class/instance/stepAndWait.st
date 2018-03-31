Managing-Processes
stepAndWait

	[ self isStepping ]
		whileTrue: [ self step.
			self wait ]