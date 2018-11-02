"
I am a base class for simple Storm-based applications running in a Morphic window. I handle the basic animation and physics simulation loop, and provide hooks for my subclasses to define application-specific behavior.

Instance Variables
	currentScene:		<Object>
	engine:		<Object>
	players:		<Object>
	scenes:		<Object>
	stepWalker:		<Object>
	surfaceContainer:		<Object>
	window:		<Object>

currentScene
	- xxxxx

engine
	- xxxxx

players
	- xxxxx

scenes
	- xxxxx

stepWalker
	- xxxxx

surfaceContainer
	- xxxxx

window
	- xxxxx

"
Class {
	#name : #WinterGame,
	#superclass : #Object,
	#instVars : [
		'scheduler',
		'collisionHandlers',
		'screen',
		'scene'
	],
	#category : 'Winter-Core-Base'
}

{ #category : #Accessing }
WinterGame >> addPlayer: aPlayer [

	aPlayer game: self.
	scene addPlayer: aPlayer.
]

{ #category : #Accessing }
WinterGame >> dimensions [
	"A point representing the size of the board."
	^self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
WinterGame >> eventHandlerFor: aScreen [ 
	^scene eventHandlerFor: aScreen
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
	scheduler := AnimationsScheduller new
]

{ #category : #Rendering }
WinterGame >> loadWidgets [
	
]

{ #category : #events }
WinterGame >> pushEvent: anEvent [

	anEvent isGameEvent
		ifTrue: [ anEvent execute: self screen  ]
		
]

{ #category : #Rendering }
WinterGame >> renderOn: aCanvas [ 
	scene renderOn: aCanvas 
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
	screen := aScreen
]

{ #category : #'start/stop' }
WinterGame >> start [

	self screen show.
	scheduler  startProcess
	
]

{ #category : #'as yet unclassified' }
WinterGame >> startAnimation [
	
]

{ #category : #Accessing }
WinterGame >> stepTime [
	"Frames per second"
	^30
]

{ #category : #'start/stop' }
WinterGame >> stop [
	scheduler terminateProcess
]

{ #category : #Accessing }
WinterGame >> title [
	self subclassResponsibility
]

{ #category : #Rendering }
WinterGame >> updateUsing: aCanvas [ 
	
	scene updateUsing: aCanvas 
]
