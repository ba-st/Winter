accessing
bootstrapCharacterCell: cell playerIndex: index
	| character |
	character := characters at: index.
	cell ground: grounds first.
	cell element: character.
	(startGame players at: index) character: character.
	character cell: cell.
	character player: (startGame players at: index).
	character spell: (spells at: index).
	character game: startGame