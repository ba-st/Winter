"
An abstract 2D wall shape
"
Class {
	#name : #WinterWallShape,
	#superclass : #GameShape,
	#category : #'Winter-Examples-Resources'
}

{ #category : #Accessing }
WinterWallShape >> bounds [

	^self position extent: self  extent.
]

{ #category : #Accessing }
WinterWallShape >> bounds: aRectangle [
	self position: aRectangle origin.
	self extent: aRectangle extent.
]

{ #category : #Drawing }
WinterWallShape >> createPaintOn: aCanvas [
	^ graphicsPaint := self color
]

{ #category : #Drawing }
WinterWallShape >> createPathOn: aCanvas [

	^graphicsPath  := aCanvas createPath: [ :builder |
			builder 
				relative;
				moveTo: self position;
				lineTo: self extent.
				"Check this."
				builder close ]
]

{ #category : #private }
WinterWallShape >> drawShape: aShape on: aCanvas [

	aCanvas drawShape: aShape
]

{ #category : #Drawing }
WinterWallShape >> renderShape: aShape on: aCanvas [

	aCanvas drawShape: aShape
]

{ #category : #private }
WinterWallShape >> setSpecificPaint: aPaint on: aCanvas [

	aCanvas setStrokePaint: aPaint
]
