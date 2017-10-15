accessing
addPlayer: aPlayer
	aPlayer game: self.
	players add: aPlayer.
	aPlayer becomePartOfScene: currentScene .