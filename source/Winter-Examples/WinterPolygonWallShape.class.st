"
A 2D Polygon  wall shape
"
Class {
	#name : #WinterPolygonWallShape,
	#superclass : #WinterWallShape,
	#instVars : [
		'vertices'
	],
	#category : #'Winter-Examples-Resources'
}

{ #category : #'Instance Creation' }
WinterPolygonWallShape class >> vertices: clockwiseConvexPoints [
	^ self new
		initializeVertices: clockwiseConvexPoints
]

{ #category : #Accessing }
WinterPolygonWallShape >> bounds [

	^ Polygon vertices: vertices
]

{ #category : #Drawing }
WinterPolygonWallShape >> createPathOn: aCanvas [

	^graphicsPath := aCanvas
		createPath: [ :builder | 
			builder
				absolute;
				moveTo: vertices first.
			vertices allButFirstDo: [ :each | builder lineTo: each ].
			builder close ]
]

{ #category : #Initialization }
WinterPolygonWallShape >> initializeVertices: aPointsArray [
	position := 0 @ 0.
	vertices := aPointsArray
]

{ #category : #Drawing }
WinterPolygonWallShape >> setSpecificPaint: aPaint on: aCanvas [

	aCanvas setPaint: aPaint
]
