"
An abstract 2D wall shape
"
Class {
	#name : #WinterWallShape,
	#superclass : #Winter2DShape,
	#category : 'Winter-Examples-Resources'
}

{ #category : #Drawing }
WinterWallShape >> createPaintOn: aCanvas [
	^ graphicsPaint := self color
]

{ #category : #Drawing }
WinterWallShape >> renderShape: aShape on: aCanvas [

	aCanvas drawShape: aShape
]
