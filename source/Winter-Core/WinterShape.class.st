"
I am a game element with a visual representation.
"
Class {
	#name : #WinterShape,
	#superclass : #WinterComponent,
	#category : 'Winter-Core-Base'
}

{ #category : #Rendering }
WinterShape >> renderOn: aSurface [

	self subclassResponsibility
]
