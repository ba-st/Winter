actions
endScreenComputation
	startingGame gameDescriptor characterDescriptors: ((1 to: startingGame players size) collect: [ :i | 
		WBACharacterDescriptor new
			fileName: 'perso' , ((currentChoices at: i) x + 1) printString;
			position: (#(0 96 192 288) at: (currentChoices at: i) y \\ 4 + 1) @ (#(0 192) at: (currentChoices at: i) y // 4 + 1) ;
			yourself]).