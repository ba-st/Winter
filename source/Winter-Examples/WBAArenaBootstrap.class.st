"
I am the boostraper of the WBA game

Instance variables: 

- grounds 
- walls 
- characters 
- spells 
- arena 
- startGame

Public API and Key Messages:

- bootstrapGame:on:
"
Class {
	#name : #WBAArenaBootstrap,
	#superclass : #Object,
	#instVars : [
		'grounds',
		'walls',
		'characters',
		'spells',
		'arena',
		'startGame'
	],
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #Bootstraping }
WBAArenaBootstrap >> bootstrapArena: arenaDescriptor [

	arena cells: ( Array new: arenaDescriptor cellDescriptors size ).
	arenaDescriptor cellDescriptors
		withIndexDo: [ :column :colIndex | 
			| newCol |

			newCol := Array new: column size.
			arena cells at: colIndex put: newCol.
			column
				withIndexDo: [ :indexDescr :cellIndex | 
					| newCell |

					newCell := WBACell new.
					newCol at: cellIndex put: newCell.
					arenaDescriptor dispatchIndex: indexDescr on: self with: newCell
					]
			].
	self bootstrapCellNeighbours
]

{ #category : #Bootstraping }
WBAArenaBootstrap >> bootstrapCellNeighbours [

	| fakeCell |

	"down left right up"
	fakeCell := WBACell new.
	fakeCell element: WBAWall new.
	arena cells
		withIndexDo: [ :col :colIndex | 
			col
				withIndexDo: [ :cell :cellIndex | 
					cell neighbours: ( Array new: 4 ).
					cell neighbours
						at: 2
						put:
							( colIndex > 1
								ifTrue: [ ( arena cells at: colIndex - 1 ) at: cellIndex ]
								ifFalse: [ fakeCell ] ).
					cell neighbours
						at: 3
						put:
							( colIndex < arena cells size
								ifTrue: [ ( arena cells at: colIndex + 1 ) at: cellIndex ]
								ifFalse: [ fakeCell ] ).
					cell neighbours
						at: 4
						put:
							( cellIndex > 1
								ifTrue: [ col at: cellIndex - 1 ]
								ifFalse: [ fakeCell ] ).
					cell neighbours
						at: 1
						put:
							( cellIndex < col size
								ifTrue: [ col at: cellIndex + 1 ]
								ifFalse: [ fakeCell ] )
					]
			]
]

{ #category : #Bootstraping }
WBAArenaBootstrap >> bootstrapCharacterCell: cell playerIndex: index [

	| character |

	character := characters at: index.
	cell ground: grounds first.
	cell element: character.
	( startGame players at: index ) character: character.
	character cell: cell.
	character player: ( startGame players at: index ).
	character spell: ( spells at: index ).
	character game: startGame
]

{ #category : #Bootstraping }
WBAArenaBootstrap >> bootstrapGame: startingGame on: screen [

	arena := WBAArena new.
	startGame := startingGame.
	screen extent: startingGame gameDescriptor arenaDescriptor windowExtent.
	screen eventHandler: ( self eventHandler: screen ).
	self loadSprites: startingGame gameDescriptor surface: screen surface.
	self bootstrapArena: startingGame gameDescriptor arenaDescriptor.
	screen model: arena.
	arena screen: screen
]

{ #category : #Bootstraping }
WBAArenaBootstrap >> bootstrapGroundOnlyCell: cell [

	cell element: WBAEmpty empty.
	cell ground: grounds atRandom
]

{ #category : #Bootstraping }
WBAArenaBootstrap >> bootstrapWallCell: cell [

	cell element: walls atRandom.
	cell ground: grounds first
]

{ #category : #Loading }
WBAArenaBootstrap >> eventHandler: screen [

	^ SceneEventHandler new
		players: startGame players;
		schedulers:
			{startGame scheduler.
			screen scheduler};
		yourself
]

{ #category : #Loading }
WBAArenaBootstrap >> loadDescriptor: descr surface: surface into: class [

	^ class new
		sprites: ( descr loadSpritesWith: surface using: startGame assetsManager );
		scheduler: startGame scheduler;
		yourself
]

{ #category : #Loading }
WBAArenaBootstrap >> loadSprites: gameDescr surface: surface [

	| assetsManager |

	assetsManager := startGame assetsManager.
	grounds := gameDescr groundDescriptor loadSpritesWith: surface using: assetsManager.
	walls := ( gameDescr wallDescriptor loadSpritesWith: surface using: assetsManager )
		collect: [ :each | 
			WBAWall new
				sprite: each;
				yourself
			].
	spells := gameDescr spellDescriptors
		collect: [ :each | self loadDescriptor: each surface: surface into: WBASpell ].
	characters := gameDescr characterDescriptors
		collect: [ :each | self loadDescriptor: each surface: surface into: WBACharacter ]
]
