"
Abstraction for game window
"
Class {
	#name : #WinterGameWindow,
	#superclass : #Object,
	#instVars : [
		'game',
		'window',
		'surfaceContainer'
	],
	#category : #'Winter-View-View'
}

{ #category : #'Instance Creation' }
WinterGameWindow class >> over: aGame [

	^ self new initializeOver: aGame
]

{ #category : #Interactions }
WinterGameWindow >> addInteraction: anInteraction [
	window
		on: anInteraction keyword
		do: anInteraction action
]

{ #category : #Initialization }
WinterGameWindow >> buildWindow [
	window := (StandardWindow labelled: game title)
		extent: game dimensions + (0 @ 25);
		yourself.
	window
		addMorph: (surfaceContainer := ImageMorph new image: (Form extent: game dimensions depth: 32))
		fullFrame: (LayoutFrame fractions: (0 @ 0 corner: 1 @ 1) offsets: (0 @ 0 corner: 0 @ 0)).
	window announcer
		when: WindowClosed
		do: [ game stop.
			window := nil ]
]

{ #category : #Initialization }
WinterGameWindow >> initializeOver: aGame [
	game := aGame.
	self buildWindow
]

{ #category : #Accessing }
WinterGameWindow >> offset [
	^ 90
]

{ #category : #Accessing }
WinterGameWindow >> playableExtentX [

	^ game dimensions x - self offset
]

{ #category : #Accessing }
WinterGameWindow >> playableExtentY [
	^ game dimensions y - self offset
]

{ #category : #Accessing }
WinterGameWindow >> positionX [
	^ window position x
]

{ #category : #Accessing }
WinterGameWindow >> positionY [
	^ window position y
]

{ #category : #Displaying }
WinterGameWindow >> show [
	window openAsIs
]

{ #category : #Accessing }
WinterGameWindow >> surfaceContainer [
	^ surfaceContainer
]
