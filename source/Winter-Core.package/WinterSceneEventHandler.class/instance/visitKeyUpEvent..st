visiting
visitKeyUpEvent: anEvent

	players do: [ :each |
		each handleKeyUp: anEvent]