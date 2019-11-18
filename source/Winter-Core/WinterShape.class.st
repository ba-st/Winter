"
I am a class to represent a game element with a visual representation

Public API and Key Messages:

- renderOn:

"
Class {
	#name : #WinterShape,
	#superclass : #WinterComponent,
	#category : #'Winter-Core-Base'
}

{ #category : #Rendering }
WinterShape >> renderOn: aSurface [

	self subclassResponsibility
]
