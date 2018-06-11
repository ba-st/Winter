Bootstrap
dispatchIndex: index on: bootstraper with: cell
	index = 0 ifTrue: [ ^ bootstraper bootstrapGroundOnlyCell: cell ].
	index = 1 ifTrue: [ ^ bootstraper bootstrapWallCell: cell ].
	^ bootstraper bootstrapCharacterCell: cell playerIndex: index - 1 