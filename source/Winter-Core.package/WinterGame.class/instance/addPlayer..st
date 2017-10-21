accessing
addPlayer: aPlayer
	aPlayer game: self.
	players add: aPlayer.
	currentScene addPlayer: aPlayer.