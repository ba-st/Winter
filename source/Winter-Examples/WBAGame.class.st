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
	#superclass : #WinterGame,
	#instVars : [
		'descriptor',
		'gameDescriptor'
	],
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #accessing }
WBAGame class >> start [

	^WBANumberPlayerSelectScreenModel new
		screen: WinterScreen new;
		display
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
	^gameDescriptor
]

{ #category : #Accessing }
WBAGame >> gameDescriptor: anObject [
	gameDescriptor := anObject
]

{ #category : #initialization }
WBAGame >> initializeResources [

	WBATextDescriptor new loadSpritesWith: nil using: self assetsManagementSystem
]

{ #category : #initialization }
WBAGame >> initializeScenes [

	self scene: Winter2DScene new
]

{ #category : #initialization }
WBAGame >> initializeSchedulers [

	super initializeSchedulers .
	scheduler  := AnimationsScheduler new.
]

{ #category : #Accessing }
WBAGame >> players [
	^scene players
]

{ #category : #Accessing }
WBAGame >> players: aPlayersCollection [ 
aPlayersCollection do: [ :each | self addPlayer: each ].

]

{ #category : #Accessing }
WBAGame >> textSpritesAt: aName [ 

	^self assetsManagementSystem  assetNamed: aName
]

{ #category : #Accessing }
WBAGame >> title [

	^'Wizard Battle Arena'
]
