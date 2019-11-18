"
I am a base class for a game. I handle the basic animation and physics simulation loop, and provide hooks for my subclasses to define application-specific behavior.

Instance Variables
- scheduler
- collisionHandlers
- screen
- scene
- rootSystem

Public API and Key Messages:

- addPlayer:
- assetsManagementSystem
- eventHandlerFor:
- extent
- handleCollision:
- renderOn:
- scene
- scene:
- scheduler
- screen
- screen:
- start
- updateUsing:





"
Class {
	#name : #WinterGame,
	#superclass : #Object,
	#instVars : [
		'scheduler',
		'collisionHandlers',
		'screen',
		'scene',
		'rootSystem',
		'dimensions',
		'title'
	],
	#category : #'Winter-Core-Base'
}

{ #category : #Accessing }
WinterGame >> addPlayer: aPlayer [

	aPlayer game: self.
	scene addPlayer: aPlayer.
]

{ #category : #Accessing }
WinterGame >> assetsManagementSystem [

	^rootSystem systemImplementing: #AssetsManagementSystemInterface
]

{ #category : #Accessing }
WinterGame >> dimensions [

	^ 650 @ 700
]

{ #category : #Accessing }
WinterGame >> dimensions: aPoint [

	dimensions := aPoint
]

{ #category : #events }
WinterGame >> eventHandlerFor: aScreen [

	^ WinterSceneEventHandler new
		players: scene players;
		schedulers: {aScreen scheduler};
		yourself
]

{ #category : #Accessing }
WinterGame >> extent [
	^self screen window handle extent
]

{ #category : #events }
WinterGame >> handleCollision: aCollision [

	^collisionHandlers
		detect: [ :each | each canHandle: aCollision ]
		ifFound: [ :handler | handler value: aCollision ]
		ifNone: [ "Por el momento nada" ]
]

{ #category : #initialization }
WinterGame >> initialize [
	super initialize.
	self initializeSystems.
	self initializeSchedulers.
	collisionHandlers := OrderedCollection new.
	self initializeCollisionHandlers.
	self initializeResources.
	self initializeScenes.
	self initializePlayers
]

{ #category : #initialization }
WinterGame >> initializeCollisionHandlers [
]

{ #category : #initialization }
WinterGame >> initializePlayers [
	"Load players"
]

{ #category : #initialization }
WinterGame >> initializeResources [
	"Load cached resources"
]

{ #category : #initialization }
WinterGame >> initializeScenes [
	"Load scenes"
]

{ #category : #initialization }
WinterGame >> initializeSchedulers [

	scheduler := AnimationsScheduler new
]

{ #category : #initialization }
WinterGame >> initializeSystems [

	rootSystem := CompositeSystem new.
	rootSystem
		register: WinterAssetManagementSystem new;
		startUp
]

{ #category : #'Screen Model Compatibility' }
WinterGame >> loadWidgets [
	
]

{ #category : #printing }
WinterGame >> printOn: aStream [

	aStream nextPutAll: self title
]

{ #category : #Rendering }
WinterGame >> renderOn: aCanvas [ 
	scene renderOn: aCanvas 
]

{ #category : #Accessing }
WinterGame >> rootSystem [

	^ rootSystem
]

{ #category : #Accessing }
WinterGame >> scene [
	^scene
]

{ #category : #Accessing }
WinterGame >> scene: aScene [

	scene := aScene.
	scene game: self.
	scene activate.
	
]

{ #category : #Accessing }
WinterGame >> scheduler [

	^ scheduler
]

{ #category : #Accessing }
WinterGame >> screen [

	screen isNil
		ifTrue: [ self buildWindow ].
	^ screen
]

{ #category : #Accessing }
WinterGame >> screen: aScreen [ 

	screen := aScreen.
]

{ #category : #'start/stop' }
WinterGame >> start [

	self screen show.
	scheduler  startProcess
	
]

{ #category : #'Screen Model Compatibility' }
WinterGame >> startAnimation [
	
]

{ #category : #'start/stop' }
WinterGame >> stop [

	scheduler terminateProcess
]

{ #category : #Accessing }
WinterGame >> title [

	^ title
]

{ #category : #Accessing }
WinterGame >> title: aString [

	title := aString
]

{ #category : #Updating }
WinterGame >> updateUsing: aCanvas [ 
	
	scene updateUsing: aCanvas 
]
