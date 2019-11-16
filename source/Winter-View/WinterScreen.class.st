"
Class representenging the screen for the visualization of the game

Public API and Key Messages

- createSurface  
- createWindow
- eventHandler:
- extentX
- extentY
- model:
- positionX
- render
- rootSystem
- scheduler
- show
- terminateRendering
- updateAndRender
- window

 
Internal Representation and Key Implementation Points.

    Instance Variables
		model 
		window 
		surface 
		scheduler 
		title 
		rootSystem
	
"
Class {
	#name : #WinterScreen,
	#superclass : #Object,
	#instVars : [
		'model',
		'window',
		'surface',
		'scheduler',
		'title',
		'rootSystem'
	],
	#category : #'Winter-View-View'
}

{ #category : #'Instance Creation' }
WinterScreen class >> onModel: aModel [

	^ self new initializeOnModel: aModel
]

{ #category : #private }
WinterScreen >> createSurface [

	surface := AthensCairoSDLSurface fromSDLSurface: self window handle handle getWindowSurface
]

{ #category : #private }
WinterScreen >> createWindow [

	window := OSWindow createWithAttributes: (OSWindowAttributes new resizable: false; yourself).
	window title: title.
	^window
]

{ #category : #Accessing }
WinterScreen >> eventHandler: anEventHandler [

	self window eventHandler: anEventHandler
]

{ #category : #Accessing }
WinterScreen >> extent [

		^self window extent
]

{ #category : #Accessing }
WinterScreen >> extent: extent [

	self window extent: extent.
	self createSurface. "not valid anymore"
]

{ #category : #Accessing }
WinterScreen >> extentX [
		^self extent x
]

{ #category : #Accessing }
WinterScreen >> extentY [
		^self extent y
]

{ #category : #initialization }
WinterScreen >> initialize [

	super initialize.
	title := ''.
	scheduler := SteppingScheduler managing:  self.
	rootSystem := Binding undefinedExplainedBy: 'The composite system was not installed' raising: SystemControlError
]

{ #category : #initialization }
WinterScreen >> initializeOnModel: aModel [

	aModel loadWidgets.
	aModel startAnimation.
	self model: aModel
]

{ #category : #Accessing }
WinterScreen >> model: aViewModel [

	model := aViewModel
]

{ #category : #Accessing }
WinterScreen >> positionX [

	^ self window handle position x
]

{ #category : #initialization }
WinterScreen >> printOn: aStream [

	aStream
		nextPutAll:
			('<1s> - title: <2s> - model: <3s>'
				expandMacrosWith: self class name
				with: title
				with: model printString)
]

{ #category : #rendering }
WinterScreen >> render [

	surface drawDuring: [ :canvas |
		model renderOn: canvas ].
	self window handle handle updateWindowSurface
]

{ #category : #rendering }
WinterScreen >> renderBackground: canvas color: color [

	canvas setShape: (0@0 corner: window extent).
	canvas setPaint: color.
	canvas draw
]

{ #category : #Accessing }
WinterScreen >> rootSystem [

	^ rootSystem content
]

{ #category : #Accessing }
WinterScreen >> rootSystem: aRootSystem [

	^ rootSystem := Binding to: aRootSystem
]

{ #category : #Accessing }
WinterScreen >> scheduler [

	^ scheduler
]

{ #category : #rendering }
WinterScreen >> show [

	self extent: model dimensions .
	self eventHandler: (model eventHandlerFor: self).
	scheduler startProcess 
]

{ #category : #Accessing }
WinterScreen >> surface [

	^ surface
]

{ #category : #rendering }
WinterScreen >> terminateRendering [

	scheduler terminateProcess
]

{ #category : #Accessing }
WinterScreen >> title: aTitle [

	title := aTitle 
]

{ #category : #rendering }
WinterScreen >> updateAndRender [

	surface drawDuring: [ :canvas |
		model updateUsing: canvas.
		model renderOn: canvas ].
	self window handle handle updateWindowSurface
]

{ #category : #Accessing }
WinterScreen >> window [

	^ window ifNil: [ self createWindow  ] ifNotNil: [window] 
]
