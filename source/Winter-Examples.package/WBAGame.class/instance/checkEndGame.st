as yet unclassified
checkEndGame

	| alivePlayers |

	alivePlayers := self players reject: [ :each | each character isDead ].
	alivePlayers size = 1
		ifTrue: [ self endScreen: alivePlayers first ]