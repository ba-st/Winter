Screen Building
newSpellWidgets: numPlayers
	| spellSprites widgets |
	spellSprites := self loadSpellSprites.
	widgets := spellSprites collect: [ :sp | self newAnimatedWidget: sp ].
	^ (1 to: numPlayers) collect: [ :i |
		self newRowWidget: widgets space: 80 ]