"
Abstract representation of a Map Object
"
Class {
	#name : #WinterMapObject,
	#superclass : #Object,
	#instVars : [
		'x',
		'y',
		'name',
		'opacity',
		'visible',
		'color'
	],
	#category : #'Winter-Tiled'
}

{ #category : #Accessing }
WinterMapObject >> color [

	^ color
]

{ #category : #Accessing }
WinterMapObject >> color: aColor [

	color := aColor
]

{ #category : #Drawing }
WinterMapObject >> drawOn: aCanvas [

	self flag: 'Should draw?'
]

{ #category : #initialization }
WinterMapObject >> initialize [

	name := ''.
	opacity := 1.0.
	visible := true.
	color := Color white
]

{ #category : #Accessing }
WinterMapObject >> name [

	^ name
]

{ #category : #Accessing }
WinterMapObject >> name: aName [

	 name := aName
]

{ #category : #Accessing }
WinterMapObject >> opacity [

	^ opacity
]

{ #category : #Accessing }
WinterMapObject >> opacity: aFloat [

	opacity := aFloat 
]

{ #category : #Accessing }
WinterMapObject >> visible [

	^ visible
]

{ #category : #Accessing }
WinterMapObject >> visible: aBoolean [

	visible := aBoolean 
]

{ #category : #Accessing }
WinterMapObject >> x [

	^ x
]

{ #category : #Accessing }
WinterMapObject >> x: anX [

	x := anX
]

{ #category : #Accessing }
WinterMapObject >> y [

	^ y
]

{ #category : #Accessing }
WinterMapObject >> y: anY [

	y := anY
]
