"
I am a class to check if theres is a collision between 2 components.


Instance Variables
- firstComponent 
- secondComponent  


Public API and Key Messages:

- value
"
Class {
	#name : #CollisionChecker,
	#superclass : #Object,
	#category : #'Winter-Physics-Collisions'
}

{ #category : #'Checking - Window borders' }
CollisionChecker >> assertIsAnAxisSymbol: aSymbol [

	| symbol |

	symbol := aSymbol asLowercase.
	( #(#x #y) includes: symbol )
		ifFalse: [ AssertionFailed signal: 'Symbol passed to border checker should be x, X, y or Y' ]
]

{ #category : #'Checking - Components' }
CollisionChecker >> checkFor: aComponent and: anotherComponent [

	( aComponent collisionShape intersects: anotherComponent collisionShape )
		ifTrue: [ ( CollisionOcurred between: aComponent and: anotherComponent ) signal ]
]

{ #category : #'Checking - Window borders' }
CollisionChecker >> checkFor: aComponent and: aGame onAxis: anAxisSymbol [

	"Axis symbol should be #x , #X , #y or #Y"

	self assertIsAnAxisSymbol: anAxisSymbol.
	( self component: aComponent collidesWithBordersOf: aGame onAxis: anAxisSymbol )
		ifTrue: [ ( CollisionOcurred of: aComponent onWindowAxis: anAxisSymbol ) signal ]
]

{ #category : #'Checking - Window borders' }
CollisionChecker >> component: aComponent collidesOnPositionOrExtentOfAxis: axisSymbol [

	^ ( aComponent position perform: axisSymbol asLowercase asSymbol )
		> ( aComponent game screen perform: ( #extent , axisSymbol asUppercase ) asSymbol )
		or: [ ( aComponent position perform: axisSymbol asLowercase asSymbol )
				< ( aComponent game screen perform: ( #position , axisSymbol asUppercase ) asSymbol )
			]
]

{ #category : #'Checking - Window borders' }
CollisionChecker >> component: aComponent collidesWithBordersOf: aGame onAxis: axisSymbol [

	| axisComponentPosition |

	axisComponentPosition := aComponent position perform: axisSymbol asLowercase asSymbol.
	^ axisComponentPosition > ( aGame screen extent perform: axisSymbol asLowercase asSymbol )
		or: [ axisComponentPosition < ( aGame screen position perform: axisSymbol asLowercase asSymbol ) ]
]

{ #category : #printing }
CollisionChecker >> printOn: aStream [

	aStream nextPutAll: 'Collission checker'
]
