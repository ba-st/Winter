"
Game resource for tests
"
Class {
	#name : #WinterTestGame,
	#superclass : #WinterGame,
	#category : 'Winter-TestResources'
}

{ #category : #accessing }
WinterTestGame >> dimensions [

	^ 650 @ 700
]

{ #category : #initialization }
WinterTestGame >> initializeScenes [

	self scene: WinterTestScene new
]

{ #category : #accessing }
WinterTestGame >> title [

	^ 'Test'
]
