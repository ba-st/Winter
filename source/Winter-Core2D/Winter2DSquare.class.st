"
Square abstraction as a WInter Component
"
Class {
	#name : #Winter2DSquare,
	#superclass : #Winter2DShape,
	#instVars : [
		'extentPoint'
	],
	#category : #'Winter-Core2D-Base'
}

{ #category : #'Instance Creation' }
Winter2DSquare class >> ofCenter: aPoint extent: anotherPoint color: aColor in: aGame [

	^ self new initializeOfCenter: aPoint extent: anotherPoint color: aColor in: aGame
	
]

{ #category : #Accessing }
Winter2DSquare >> bounds [

	^ position extent: extentPoint
]

{ #category : #private }
Winter2DSquare >> createPaintOn: aCanvas [

	^ graphicsPaint := self color
]

{ #category : #private }
Winter2DSquare >> createPathOn: aCanvas [

	^graphicsPath := self bounds  
]

{ #category : #Accessing }
Winter2DSquare >> extent [

	^extentPoint
]

{ #category : #Accessing }
Winter2DSquare >> extent: aPoint [

	extentPoint := aPoint
]

{ #category : #Initialization }
Winter2DSquare >> initializeOfCenter: aPoint extent: anotherPoint color: aColor in: aGame [

	position := aPoint .
	extentPoint := anotherPoint.
	color := aColor.
	game := aGame 
]

{ #category : #private }
Winter2DSquare >> renderShape: aShape on: aCanvas [

	aCanvas drawShape: aShape
]

{ #category : #private }
Winter2DSquare >> setSpecificPaint: aPaint on: aCanvas [

	aCanvas setPaint: aPaint
]
