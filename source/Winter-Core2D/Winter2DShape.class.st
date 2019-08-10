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
	#name : #Winter2DShape,
	#superclass : #WinterShape,
	#instVars : [
		'position',
		'color',
		'graphicsPath',
		'graphicsPaint'
	],
	#category : #'Winter-Core2D-Base'
}

{ #category : #Defaults }
Winter2DShape class >> defaultColor [
	^Color white
]

{ #category : #Defaults }
Winter2DShape class >> defaultRadius [
	^10
]

{ #category : #Accessing }
Winter2DShape >> bounds [
	self subclassResponsibility 
]

{ #category : #Accessing }
Winter2DShape >> color [
	^color ifNil: [ color := self class defaultColor ].
]

{ #category : #Accessing }
Winter2DShape >> color: aColor [
	color := aColor.
	graphicsPaint := nil.
]

{ #category : #private }
Winter2DShape >> createPaintOn: aCanvas [

	self subclassResponsibility
]

{ #category : #private }
Winter2DShape >> createPathOn: aCanvas [

	self subclassResponsibility
]

{ #category : #Initialization }
Winter2DShape >> initialize [

	color := self class defaultColor.
	position := 0 @ 0
]

{ #category : #Collisions }
Winter2DShape >> intersects: aWinter2DShape [

	^ self bounds intersects: aWinter2DShape bounds
]

{ #category : #Drawing }
Winter2DShape >> paintOn: aCanvas [
	^ graphicsPaint ifNil:
		[ self createPaintOn: aCanvas ]
]

{ #category : #Drawing }
Winter2DShape >> pathOn: aCanvas [

	^ graphicsPath ifNil: [ self createPathOn: aCanvas ]
]

{ #category : #Accessing }
Winter2DShape >> position [
	^ position
]

{ #category : #Accessing }
Winter2DShape >> position: aPosition [
	position := aPosition 
]

{ #category : #Drawing }
Winter2DShape >> renderOn: aCanvas [
	aCanvas pathTransform
		restoreAfter: [ aCanvas pathTransform translateBy: self position.
			self setSpecificPaint: (self paintOn: aCanvas) on: aCanvas.
			self renderShape: (self pathOn: aCanvas) on: aCanvas ]
]

{ #category : #private }
Winter2DShape >> renderShape: aShape on: aCanvas [

	self subclassResponsibility
]

{ #category : #private }
Winter2DShape >> setSpecificPaint: aPaint on: aCanvas [

	self subclassResponsibility
]

{ #category : #Updating }
Winter2DShape >> updatePosition [

"should reimplement if want to update position form here automatically"
]

{ #category : #Updating }
Winter2DShape >> updatePositionBy: aPoint [

	position := position + aPoint
]

{ #category : #Events }
Winter2DShape >> updateUsing: aCanvas [

	self updatePosition.
]
