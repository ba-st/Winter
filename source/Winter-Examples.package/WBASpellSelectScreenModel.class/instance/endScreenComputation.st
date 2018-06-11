actions
endScreenComputation
	startingGame gameDescriptor spellDescriptors: ((1 to: startingGame players size) collect: [ :i | 
		WBASpellDescriptor new
			fileName: 'spell' , ((currentChoices at: i) + 1) printString;
			yourself]).