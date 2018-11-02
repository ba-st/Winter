"
A 2D container box made of 3 walls
"
Class {
	#name : #WinterContainerBoxShape,
	#superclass : #Winter2DShape,
	#instVars : [
		'extent',
		'walls'
	],
	#category : 'Winter-Examples-Resources'
}

{ #category : #'Instance Creation' }
WinterContainerBoxShape class >> ofBounds: aRectangle [
	^ self ofBounds: aRectangle andColor: Color white
]

{ #category : #'Instance Creation' }
WinterContainerBoxShape class >> ofBounds: aRectangle andColor: aColor [
	^ self new initializaBounds: aRectangle ofColor: aColor
]

{ #category : #Accessing }
WinterContainerBoxShape >> bounds [
	^self position extent: self  extent.
]

{ #category : #Accessing }
WinterContainerBoxShape >> bounds: aRectangle [
	self position: aRectangle origin.
	self extent: aRectangle extent.
]

{ #category : #Collision }
WinterContainerBoxShape >> checkCollision [
	walls do: [ :wall | wall checkCollision ]
]

{ #category : #Drawing }
WinterContainerBoxShape >> createPaintOn: aCanvas [
	^ graphicsPaint := self color
]

{ #category : #Drawing }
WinterContainerBoxShape >> createPathOn: aCanvas [
	"Depends on its 3 walls so it does not have its own path for now"

	^ nil
]

{ #category : #Accessing }
WinterContainerBoxShape >> extent [
	^extent
]

{ #category : #Accessing }
WinterContainerBoxShape >> extent: aPoint [
	extent := aPoint
]

{ #category : #Initialization }
WinterContainerBoxShape >> initializaBounds: aRectangle ofColor: aColor [
	self bounds: aRectangle.
	color := aColor.
	walls := {(position x @ (position y - extent x) extent: extent transposed).
	(position extent: extent).
	((position + extent) x @ (position y - extent x) extent: extent transposed)}
		collect: [ :each | 
			WinterTinyWallShape new
				color: color;
				bounds: each;
				yourself ]
]

{ #category : #Drawing }
WinterContainerBoxShape >> renderShape: aShape on: aCanvas [
"aShape will not be a shape because there are 3 chapes here"
	walls do: [ :wall | aCanvas drawShape: (wall pathOn: aCanvas) ]
]

{ #category : #Drawing }
WinterContainerBoxShape >> setSpecificPaint: aPaint on: aCanvas [
	(aCanvas setStrokePaint: aPaint) width: 5
]
