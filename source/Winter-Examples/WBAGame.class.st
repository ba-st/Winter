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

{ #category : #'as yet unclassified' }
WBAGame >> checkEndGame [

	| alivePlayers |

	alivePlayers := self players reject: [ :each | each character isDead ].
	alivePlayers size = 1
		ifTrue: [ self endScreen: alivePlayers first ]
]

{ #category : #accessing }
WBAGame >> dimensions [
	^ descriptor windowExtent
]

{ #category : #'as yet unclassified' }
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

{ #category : #accessing }
WBAGame >> initializeResources [

	WBATextDescriptor new loadSpritesWith: nil using: self assetsManagementSystem
]

{ #category : #accessing }
WBAGame >> initializeScenes [

	self scene: WBAScene new
]

{ #category : #accessing }
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

{ #category : #accessing }
WBAGame >> title [

	^'Wizard Battle Arena'
]
