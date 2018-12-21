"
Represents a widget of row
"
Class {
	#name : #WinterRowWidget,
	#superclass : #WinterWidget,
	#instVars : [
		'widgets',
		'space'
	],
	#category : #'Winter-View-ViewModel'
}

{ #category : #rendering }
WinterRowWidget >> renderOn: aCanvas [

	widgets do: [ :widget | 
		widget renderOn: aCanvas.
		aCanvas pathTransform translateX: space Y: 0 ].
	aCanvas pathTransform translateX: (space * widgets size negated) Y: 0.
]

{ #category : #accessing }
WinterRowWidget >> space [
	^ space
]

{ #category : #accessing }
WinterRowWidget >> space: anObject [

	space := anObject
]

{ #category : #accessing }
WinterRowWidget >> widgets [

	^ widgets
]

{ #category : #accessing }
WinterRowWidget >> widgets: anObject [

	widgets := anObject
]
