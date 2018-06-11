actions
endScreenComputation
	startingGame gameDescriptor: (WBAGameDescriptor perform: ( 'demo' , startingGame players size printString ) asSymbol ).
	startingGame gameDescriptor backgroundDescriptor: (WBABackgroundDescriptor backgroundAt: currentChoice).