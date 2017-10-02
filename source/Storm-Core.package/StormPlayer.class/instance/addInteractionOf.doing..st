Interactions
addInteractionOf: anInteractionEvent doing: anActionBlock
	game window
		on: anInteractionEvent
		do: anActionBlock