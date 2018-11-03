"
Representation of an Ellipse Map Object
"
Class {
	#name : #WinterEllipseMapObject,
	#superclass : #WinterMapObject,
	#instVars : [
		'ellipse'
	],
	#category : 'Winter-Tiled'
}

{ #category : #'Instance Creation' }
WinterEllipseMapObject class >> of: anEllipse [

	^ self new initializeOf: anEllipse
]

{ #category : #Accessing }
WinterEllipseMapObject >> ellipse [

	^ ellipse
]

{ #category : #initialization }
WinterEllipseMapObject >> initializeOf: anEllipse [

	x := anEllipse position x.
	y := anEllipse position y.
	ellipse := anEllipse 
]
