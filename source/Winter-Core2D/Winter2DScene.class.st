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
	#name : #Winter2DScene,
	#superclass : #WinterScene,
	#instVars : [
		'surface',
		'backgroundColor'
	],
	#category : #'Winter-Core2D-Base'
}

{ #category : #Defaults }
Winter2DScene class >> defaultBackgroundColor [ 
	^Color white
]

{ #category : #Components }
Winter2DScene >> addComponent: aComponent [
	super addComponent: aComponent.
	aComponent game: game
]

{ #category : #Accessing }
Winter2DScene >> backgroundColor [
	^ backgroundColor ifNil: [ backgroundColor:= self class defaultBackgroundColor ]
]

{ #category : #Accessing }
Winter2DScene >> backgroundColor: aColor [
	backgroundColor := aColor.
]

{ #category : #Accessing }
Winter2DScene >> dimensions [
	^self game dimensions
]

{ #category : #Accessing }
Winter2DScene >> eventHandlerFor: aScreen [

	^ WinterSceneEventHandler new
		players: players;
		schedulers:
			{"game scheduler."
			aScreen scheduler};
		yourself
]

{ #category : #Accessing }
Winter2DScene >> extent [

	^game dimensions 
]

{ #category : #Accessing }
Winter2DScene >> game: aGame [
	game := aGame.
	components do: [ :each | each game: aGame ]
]

{ #category : #initialization }
Winter2DScene >> initialize [ 
	super initialize.
	self initializeComponents.
]

{ #category : #initialization }
Winter2DScene >> initializeComponents [


	
]

{ #category : #Accessing }
Winter2DScene >> players [
	^ players
]

{ #category : #Rendering }
Winter2DScene >> renderBackgroundOn: aCanvas [

	aCanvas setPaint: self backgroundColor.
	aCanvas drawShape: (0@0 fastCorner: game screen window extent)
]

{ #category : #Rendering }
Winter2DScene >> renderOn: aCanvas [

	self renderBackgroundOn: aCanvas .	
	self players do: [ :eachPlayer | eachPlayer renderOn: aCanvas ].
	self components do: [ :eachComponent | eachComponent renderOn: aCanvas ]
]

{ #category : #Accessing }
Winter2DScene >> surface [ 
	^surface ifNil: [ surface := AthensCairoSurface extent: self dimensions ].
]

{ #category : #Events }
Winter2DScene >> updateUsing: aCanvas [


	self players do: [ :eachPlayer | eachPlayer updateUsing: aCanvas ].
	self components do: [ :eachShape | eachShape updateUsing: aCanvas ]
]
