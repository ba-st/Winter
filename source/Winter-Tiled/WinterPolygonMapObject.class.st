"
Representation of a Polygon Map Object
"
Class {
	#name : #WinterPolygonMapObject,
	#superclass : #WinterMapObject,
	#instVars : [
		'polygon'
	],
	#category : 'Winter-Tiled'
}

{ #category : #'Instance Creation' }
WinterPolygonMapObject class >> of: aPolygon atX: anX andY: anY [

	^ self new initializeOf: aPolygon atX: anX andY: anY
]

{ #category : #initialization }
WinterPolygonMapObject >> initializeOf: aPolygon atX: anX andY: anY [

	polygon := aPolygon.
	x := anX.
	y := anY
]

{ #category : #Accessing }
WinterPolygonMapObject >> polygon [

	^ polygon
]
