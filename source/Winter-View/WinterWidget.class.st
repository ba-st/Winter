Class {
	#name : #WinterWidget,
	#superclass : #Object,
	#category : 'Winter-View-ViewModel'
}

{ #category : #rendering }
WinterWidget >> renderOn: aCanvas [
]

{ #category : #rendering }
WinterWidget >> renderOn: aCanvas temporarilyTranslatedBy: aPoint [ 

	aCanvas pathTransform translateBy: aPoint.
	self renderOn: aCanvas.
	aCanvas pathTransform translateBy: aPoint negated.
]

{ #category : #rendering }
WinterWidget >> renderOn: aCanvas translatedBy: aPoint [ 

	aCanvas pathTransform translateBy: aPoint.
	self renderOn: aCanvas.
]

{ #category : #rendering }
WinterWidget >> updateUsing: aCanvas [
]
