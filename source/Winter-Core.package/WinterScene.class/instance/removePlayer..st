as yet unclassified
removePlayer: aPlayer 

	aPlayer scene: nil.
	players := players  copyWithout:  aPlayer.