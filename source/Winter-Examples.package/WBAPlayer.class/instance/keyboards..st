as yet unclassified
keyboards: aKeyboardsArray
	keyboardCodes := aKeyboardsArray.
	self
		addInteractionOnKeyDownOf: (aKeyboardsArray at: 1) doing: [ self moveUp ];
		addInteractionOnKeyDownOf: (aKeyboardsArray at: 2) doing: [ self moveLeft ];
		addInteractionOnKeyDownOf: (aKeyboardsArray at: 3) doing: [ self moveDown ];
		addInteractionOnKeyDownOf: (aKeyboardsArray at: 4) doing: [ self moveRight ];
		addInteractionOnKeyDownOf: (aKeyboardsArray at: 5) doing: [ self castSpell ].
	self
		addInteractionOnKeyUpOf: (aKeyboardsArray at: 1)
			doing: [ self handleKeyUpIndex: 1 ];
		addInteractionOnKeyUpOf: (aKeyboardsArray at: 2)
			doing: [ self handleKeyUpIndex: 2 ];
		addInteractionOnKeyUpOf: (aKeyboardsArray at: 3)
			doing: [ self handleKeyUpIndex: 3 ];
		addInteractionOnKeyUpOf: (aKeyboardsArray at: 4)
			doing: [ self handleKeyUpIndex: 4 ]