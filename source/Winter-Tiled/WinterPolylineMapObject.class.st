"
Representation of a Polyline Map Object
"
Class {
	#name : #WinterPolylineMapObject,
	#superclass : #WinterMapObject,
	#instVars : [
		'polyline'
	],
	#category : #'Winter-Tiled'
}

{ #category : #'Instance Creation' }
WinterPolylineMapObject class >> of: aPolyline atX: anX andY: anY [

	^ self new initializeOf: aPolyline atX: anX andY: anY
]

{ #category : #initialization }
WinterPolylineMapObject >> initializeOf: aPolyline atX: anX andY: anY [

	polyline := aPolyline.
	x := anX.
	y := anY
]

{ #category : #Accessing }
WinterPolylineMapObject >> polyline [

	^ polyline
]
