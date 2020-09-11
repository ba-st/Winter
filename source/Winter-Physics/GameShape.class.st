"
I am a shape appearing in a 2D scene, with both a visual representation and a physical simulation..
Chipmunk2D (Native library) [ Disconnected ]

Instance Variables
- position 
- color 
- graphicsPath 
- graphicsPaint


Public API and Key Messages:

- bounds
- position 
- position: 
- color
- color:
- renderOn:
- updateUsing:
- intersects:




"
Class {
	#name : #GameShape,
	#superclass : #Object,
	#instVars : [
		'position',
		'color',
		'graphicsPath',
		'graphicsPaint'
	],
	#category : #'Winter-Physics-Shapes'
}

{ #category : #Defaults }
GameShape class >> defaultColor [

	^ Color white
]

{ #category : #Defaults }
GameShape class >> defaultRadius [

	^ 10
]

{ #category : #Accessing }
GameShape >> bounds [
	self subclassResponsibility 
]

{ #category : #Accessing }
GameShape >> color [
	^color ifNil: [ color := self class defaultColor ].
]

{ #category : #Accessing }
GameShape >> color: aColor [
	color := aColor.
	graphicsPaint := nil.
]

{ #category : #private }
GameShape >> createPaintOn: aCanvas [

	self subclassResponsibility
]

{ #category : #private }
GameShape >> createPathOn: aCanvas [

	self subclassResponsibility
]

{ #category : #private }
GameShape >> drawShape: aShape on: aCanvas [

	self subclassResponsibility
]

{ #category : #Initialization }
GameShape >> initialize [

	color := self class defaultColor.
	position := 0 @ 0
]

{ #category : #Collisions }
GameShape >> intersects: aWinter2DShape [

	^ self bounds intersects: aWinter2DShape bounds
]

{ #category : #Drawing }
GameShape >> paintOn: aCanvas [

	^ graphicsPaint ifNil: [ self createPaintOn: aCanvas ]
]

{ #category : #Drawing }
GameShape >> pathOn: aCanvas [

	^ graphicsPath ifNil: [ self createPathOn: aCanvas ]
]

{ #category : #Accessing }
GameShape >> position [

	^ position
]

{ #category : #Accessing }
GameShape >> position: aPosition [

	position := aPosition
]

{ #category : #printing }
GameShape >> printOn: aStream [

	aStream
		nextPutAll: ('2D Shape - position [<1s>]' expandMacrosWith: self position)
]

{ #category : #Drawing }
GameShape >> renderOn: aCanvas [

	aCanvas pathTransform
		restoreAfter: [ aCanvas pathTransform translateBy: self position.
			self setSpecificPaint: ( self paintOn: aCanvas ) on: aCanvas.
			self drawShape: ( self pathOn: aCanvas ) on: aCanvas
			]
]

{ #category : #private }
GameShape >> setSpecificPaint: aPaint on: aCanvas [

	self subclassResponsibility
]
