"
A 2D Tiny wall shape
"
Class {
	#name : #WinterTinyWallShape,
	#superclass : #WinterWallShape,
	#instVars : [
		'extent'
	],
	#category : 'Winter-Examples-Resources'
}

{ #category : #Defaults }
WinterTinyWallShape class >> defaultExtent [
	^100@0
]

{ #category : #Accessing }
WinterTinyWallShape >> bounds [
	^self position extent: self  extent.
]

{ #category : #Accessing }
WinterTinyWallShape >> bounds: aRectangle [
	self position: aRectangle origin.
	self extent: aRectangle extent.
]

{ #category : #Drawing }
WinterTinyWallShape >> createPathOn: aCanvas [
	^graphicsPath  := aCanvas createPath: [ :builder |
			builder 
				relative;
				moveTo: self position;
				lineTo: self extent ]
]

{ #category : #Accessing }
WinterTinyWallShape >> extent [
	^extent ifNil: [ extent := self class defaultExtent ]
]

{ #category : #Accessing }
WinterTinyWallShape >> extent: aPoint [
	extent := aPoint
]

{ #category : #Drawing }
WinterTinyWallShape >> setSpecificPaint: aPaint on: aCanvas [

	(aCanvas setStrokePaint: aPaint) width: 3.
]
