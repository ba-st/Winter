"
I am a specialized type of scene for 2D.
Chipmunk2D (Native library) [ Disconnected ]

Instance Variables
- surface 
- backgroundColor


Public API and Key Messages:

- addComponent: 
- game:
- players
- renderOn:
- updateUsing:

"
Class {
	#name : #GameScene,
	#superclass : #GameActor,
	#instVars : [
		'active',
		'components',
		'players',
		'surface',
		'background'
	],
	#category : #'Winter-Core-Base'
}

{ #category : #Defaults }
GameScene class >> defaultBackgroundColor [

	^ Color white
]

{ #category : #initialization }
GameScene >> activate [

	active := true
]

{ #category : #Components }
GameScene >> addComponent: aComponent [

	aComponent scene: self.
	aComponent game: game.
	components := components copyWith: aComponent
]

{ #category : #Managing }
GameScene >> addComponents: aCollection [

	aCollection do: [ :each | self addComponent: each ]
]

{ #category : #Managing }
GameScene >> addPlayer: aPlayer [

	aPlayer scene: self.
	players := players copyWith: aPlayer
]

{ #category : #Accessing }
GameScene >> background [

	^ background ifNil: [ background := self class defaultBackgroundColor ]
]

{ #category : #Accessing }
GameScene >> background: aColorOrImage [

	background := aColorOrImage
]

{ #category : #accessing }
GameScene >> components [

	^ components
]

{ #category : #Accessing }
GameScene >> dimensions [

	^ self game dimensions
]

{ #category : #Accessing }
GameScene >> extent [

	^ game dimensions
]

{ #category : #Accessing }
GameScene >> game: aGame [

	game := aGame.
	components do: [ :each | each game: aGame ]
]

{ #category : #initialization }
GameScene >> initialize [

	super initialize.
	players := OrderedCollection new.
	components := #().
	active := false.
	self initializeComponents
]

{ #category : #initialization }
GameScene >> initializeComponents [

	"re implement to do something"

	
]

{ #category : #testing }
GameScene >> isActive [

	^ active
]

{ #category : #Accessing }
GameScene >> player [

	^self players first
]

{ #category : #Accessing }
GameScene >> players [

	^ players
]

{ #category : #Printing }
GameScene >> printOn: aStream [

	aStream nextPutAll: self class name
]

{ #category : #Managing }
GameScene >> removeComponent: aComponent [

	components := components copyWithout: aComponent.
	aComponent scene: nil
]

{ #category : #Managing }
GameScene >> removePlayer: aPlayer [

	aPlayer scene: nil.
	players := players copyWithout: aPlayer
]

{ #category : #Rendering }
GameScene >> renderBackgroundOn: aCanvas [

	aCanvas setPaint: self background.
	aCanvas drawShape: ( 0 @ 0 fastCorner: aCanvas extent )
]

{ #category : #Rendering }
GameScene >> renderOn: aCanvas [

	self renderBackgroundOn: aCanvas.
	self players do: [ :eachPlayer | eachPlayer renderOn: aCanvas ].
	self components do: [ :eachComponent | eachComponent renderOn: aCanvas ]
]

{ #category : #Accessing }
GameScene >> surface [

	^ surface ifNil: [ surface := AthensCairoSurface extent: self dimensions ]
]

{ #category : #Events }
GameScene >> updateUsing: aCanvas [

	self players do: [ :eachPlayer | eachPlayer updateUsing: aCanvas ].
	self components do: [ :eachShape | eachShape updateUsing: aCanvas ]
]
