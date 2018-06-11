actions
endScreenComputation
	| keyCodes |
	keyCodes := WBAPlayer defaultKeyboardCodes.
	startingGame players: ((1 to: currentChoice + 1) collect: [ :i | WBAPlayer new
			keyboards: (keyCodes at: i);
			yourself ])