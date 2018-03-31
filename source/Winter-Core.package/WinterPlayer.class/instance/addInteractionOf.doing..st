Interactions
addInteractionOf: aKeyword doing: anActionBlock

	| event |
	
	event := WinterInteractionEvent of: aKeyword doing: anActionBlock.
	interactionEvents add: event.
	game pushEvent: event