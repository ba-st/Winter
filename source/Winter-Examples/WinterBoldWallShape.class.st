"
A 2D Bold wall shape
"
Class {
	#name : #WinterBoldWallShape,
	#superclass : #WinterWallShape,
	#instVars : [
		'extent'
	],
	#category : #'Winter-Examples-Resources'
}

{ #category : #'Instance Creation' }
WinterBoldWallShape class >> from: positionPoint to: endPoint [
	^ self new
		position: positionPoint
		endPoint: endPoint
]

{ #category : #Accessing }
WinterBoldWallShape >> bounds [

	^self position extent: self  extent.
]

{ #category : #Accessing }
WinterBoldWallShape >> bounds: aRectangle [

	self position: aRectangle origin.
	self extent: aRectangle extent.
]

{ #category : #Drawing }
WinterBoldWallShape >> createPathOn: aCanvas [
	^graphicsPath  := aCanvas createPath: [ :builder |
			builder 
				relative;
				moveTo: self position;
				lineTo: self extent ]
]

{ #category : #Accessing }
WinterBoldWallShape >> extent [
	^extent ifNil: [ extent := self class defaultExtent ]
]

{ #category : #Accessing }
WinterBoldWallShape >> extent: aPoint [
	extent := aPoint
]

{ #category : #Accessing }
WinterBoldWallShape >> position: positionPoint endPoint: endPoint [
	self position: positionPoint.
	self extent: endPoint - positionPoint.
]

{ #category : #Drawing }
WinterBoldWallShape >> setSpecificPaint: aPaint on: aCanvas [
	(aCanvas setStrokePaint: aPaint) width: 5
]
