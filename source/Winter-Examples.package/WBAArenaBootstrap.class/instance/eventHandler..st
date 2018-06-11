accessing
eventHandler: screen
	^ WinterSceneEventHandler  new
		players: startGame players;
		schedulers: { startGame scheduler . screen scheduler };
		yourself