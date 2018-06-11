as yet unclassified
demo: selector
	| arenaDescr numPlayers |
	arenaDescr := WBAArenaDescriptor perform: selector.
	numPlayers := arenaDescr expectedNumberOfPlayers.
	^ self new
		arenaDescriptor: arenaDescr;
		characterDescriptors: ((1 to: numPlayers) collect: [ :i | WBACharacterDescriptor randomCharacter]);
		spellDescriptors: ((1 to: numPlayers) collect: [ :i | WBASpellDescriptor randomSpell]);
		backgroundDescriptor: WBABackgroundDescriptor randomBackground;
		yourself