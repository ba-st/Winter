"
I am the base class for WBA game

Instance Variables
- scheduler
- collisionHandlers
- screen
- scene
- rootSystem

Public API and Key Messages:

- descriptor 
- gameDescriptor





"
Class {
	#name : #WBAGame,
	#superclass : #Game,
	#instVars : [
		'scheduler',
		'descriptor',
		'gameDescriptor',
		'assetsManager',
		'players'
	],
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #accessing }
WBAGame class >> start [

	^WBANumberPlayerSelectScreenModel new
		screen: WinterScreen new;
		display
]

{ #category : #Accessing }
WBAGame >> assetsManager [

	^ assetsManager 
]

{ #category : #Validating }
WBAGame >> checkEndGame [

	| alivePlayers |

	alivePlayers := self players reject: [ :each | each character isDead ].
	alivePlayers size = 1
		ifTrue: [ self endScreen: alivePlayers first ]
]

{ #category : #Accessing }
WBAGame >> dimensions [

	^ descriptor windowExtent
]

{ #category : #Computing }
WBAGame >> endScreen: winner [

	WBAEndScreenModel new
		screen: screen;
		startingGame: self;
		winner: winner;
		display
]

{ #category : #Accessing }
WBAGame >> gameDescriptor [

	^ gameDescriptor
]

{ #category : #Accessing }
WBAGame >> gameDescriptor: anObject [

	gameDescriptor := anObject
]

{ #category : #initialization }
WBAGame >> initialize [

	super initialize.
	self
		initializeResources;
		initializeSchedulers
]

{ #category : #initialization }
WBAGame >> initializeResources [

	assetsManager := AssetsManager new.
	WBATextDescriptor new loadSpritesWith: nil using: assetsManager
]

{ #category : #initialization }
WBAGame >> initializeSchedulers [

	scheduler  := AnimationsScheduler new.
]

{ #category : #Accessing }
WBAGame >> players [

	^ players
]

{ #category : #Accessing }
WBAGame >> players: aPlayersCollection [

	players := aPlayersCollection
]

{ #category : #Accessing }
WBAGame >> scheduler [

	^ scheduler
]

{ #category : #initialization }
WBAGame >> start [

	super start.
	scheduler  startProcess
	
]

{ #category : #initialization }
WBAGame >> stop [

	super stop.
	scheduler
		ifNotNil: [ scheduler terminateProcess.
			scheduler := nil
			]
]

{ #category : #Accessing }
WBAGame >> textSpritesAt: aName [

	^ assetsManager assetNamed: aName
]

{ #category : #Accessing }
WBAGame >> title [

	^'Wizard Battle Arena'
]
