evaluating
compile
	[ Compiler new 
		evaluate: self getText
		in: nil
		to: nil
		notifying: self
		ifFail: [ 
			self inform: 'Error while executing athens script'.
			^nil]
		logged: true ]
	on: OutOfScopeNotification 
	do: [ :ex | ex resume: true].
