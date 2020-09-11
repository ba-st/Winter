"
I am a Square shape appearing in a 2D scene, with both a visual representation and a physical simulation..
Chipmunk2D (Native library) [ Disconnected ]

Instance Variables
- extentPoint


Public API and Key Messages:

- bounds
- extent 
- extent:
"
Class {
	#name : #Square,
	#superclass : #GameShape,
	#instVars : [
		'extentPoint'
	],
	#category : #'Winter-Physics-Shapes'
}

{ #category : #'Instance Creation' }
Square class >> ofCenter: aPoint extent: anotherPoint color: aColor [

	^ self new initializeOfCenter: aPoint extent: anotherPoint color: aColor
]

{ #category : #Accessing }
Square >> bounds [

	^ position extent: extentPoint
]

{ #category : #private }
Square >> createPaintOn: aCanvas [

	^ graphicsPaint := self color
]

{ #category : #private }
Square >> createPathOn: aCanvas [

	^graphicsPath := self bounds  
]

{ #category : #private }
Square >> drawShape: aShape on: aCanvas [

	aCanvas drawShape: aShape
]

{ #category : #Accessing }
Square >> extent [

	^extentPoint
]

{ #category : #Accessing }
Square >> extent: aPoint [

	extentPoint := aPoint
]

{ #category : #Initialization }
Square >> initializeOfCenter: aPoint extent: anotherPoint color: aColor [

	position := aPoint.
	extentPoint := anotherPoint.
	color := aColor
]

{ #category : #printing }
Square >> printOn: aStream [

	aStream
		nextPutAll:
			( 'Square - position [<1s>] - extent: <2s> - color: <3p> '
				expandMacrosWith: self position printString
				with: self extent printString
				with: self color printString )
]

{ #category : #private }
Square >> setSpecificPaint: aPaint on: aCanvas [

	aCanvas setPaint: aPaint
]
