accessing
ensureCorrectness
	"Answers if the descriptor is in a correct state to start the game"
	self assert: arenaDescriptor expectedNumberOfPlayers = characterDescriptors size.
	self assert: spellDescriptors size = characterDescriptors size.
	