"
I am a Collision checker for a component  against borders.


Instance Variables
- component 
- gameWindow

Public API and Key Messages:

- value:
"
Class {
	#name : #CollisionAgainstMapBordersChecker,
	#superclass : #WinterReactiveObject,
	#instVars : [
		'component',
		'gameWindow'
	],
	#category : #'Winter-Core2D-Collision'
}

{ #category : #Validating }
CollisionAgainstMapBordersChecker >> assertIsAnAxisSymbol: aSymbol [

	| symbol |

	symbol := aSymbol asLowercase.
	( #(#x #y) includes: symbol )
		ifFalse: [ Error signal: 'Symbol passed to border checker should be x, X, y or Y' ]
]

{ #category : #Evaluating }
CollisionAgainstMapBordersChecker >> checkFor: aComponent onAxis: anAxisSymbol [

	"Axis symbol should be #x , #X , #y or #Y"

	self assertIsAnAxisSymbol: anAxisSymbol.
	( self component: aComponent collidesOnPositionOrExtentOfAxis: anAxisSymbol )
		ifTrue: [ ( CollisionAgainstMapBorders of: aComponent on: anAxisSymbol ) applyOnGame ]
]

{ #category : #private }
CollisionAgainstMapBordersChecker >> component: aComponent collidesOnPositionOrExtentOfAxis: axisSymbol [

	^ ( aComponent position perform: axisSymbol asLowercase asSymbol )
		> ( aComponent game screen perform: ( #extent , axisSymbol asUppercase ) asSymbol )
		or: [ ( aComponent position perform: axisSymbol asLowercase asSymbol )
				< ( aComponent game screen perform: ( #position , axisSymbol asUppercase ) asSymbol )
			]
]

{ #category : #printing }
CollisionAgainstMapBordersChecker >> printOn: aStream [

	aStream nextPutAll: 'Collission checker against axises'
]
