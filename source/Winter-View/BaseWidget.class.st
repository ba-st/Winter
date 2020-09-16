"
Abstract class to represent any widget

Public API and Key Messages

- renderOn:  
- updateUsing:
 
Internal Representation and Key Implementation Points.

    Instance Variables
		
	
"
Class {
	#name : #BaseWidget,
	#superclass : #Object,
	#category : #'Winter-View-ViewModel'
}

{ #category : #rendering }
BaseWidget >> renderOn: aCanvas [
]

{ #category : #rendering }
BaseWidget >> renderOn: aCanvas temporarilyTranslatedBy: aPoint [ 

	aCanvas pathTransform translateBy: aPoint.
	self renderOn: aCanvas.
	aCanvas pathTransform translateBy: aPoint negated.
]

{ #category : #rendering }
BaseWidget >> renderOn: aCanvas translatedBy: aPoint [ 

	aCanvas pathTransform translateBy: aPoint.
	self renderOn: aCanvas.
]

{ #category : #updating }
BaseWidget >> update [
]
