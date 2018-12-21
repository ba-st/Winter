"
Represents a widget of column
"
Class {
	#name : #WinterColumnWidget,
	#superclass : #WinterWidget,
	#instVars : [
		'widgets',
		'space'
	],
	#category : #'Winter-View-ViewModel'
}

{ #category : #'as yet unclassified' }
WinterColumnWidget >> renderOn: aCanvas [

	widgets do: [ :widget | 
		widget renderOn: aCanvas.
		aCanvas pathTransform translateX: 0 Y: space ].
	aCanvas pathTransform translateX: 0 Y: (space * widgets size negated).
]

{ #category : #acccessing }
WinterColumnWidget >> space [

	^ space
]

{ #category : #acccessing }
WinterColumnWidget >> space: anObject [

	space := anObject
]

{ #category : #acccessing }
WinterColumnWidget >> widgets [

	^ widgets
]

{ #category : #acccessing }
WinterColumnWidget >> widgets: anObject [

	widgets := anObject
]
