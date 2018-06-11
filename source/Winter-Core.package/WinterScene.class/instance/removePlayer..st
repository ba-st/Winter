Managing
removePlayer: aPlayer 

	aPlayer scene: nil.
	players := players  copyWithout:  aPlayer.