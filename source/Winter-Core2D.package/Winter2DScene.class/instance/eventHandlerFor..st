Accessing
eventHandlerFor: aScreen

	^ WinterSceneEventHandler new
		players: players;
		schedulers:
			{"game scheduler."
			aScreen scheduler};
		yourself