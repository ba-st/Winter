Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#instVars : [
		'game'
	],
	#category : #'Winter-CoreTests-Base'
}

{ #category : #finalization }
GameTest >> tearDown [

	[ game scheduler terminateProcess.
	game screen scheduler terminateProcess
	]
		on: Error
		do: [  ]
]

{ #category : #tests }
GameTest >> testAccessing [

	game := FakeGame new.

	self
		assert: game dimensions equals: 650 @ 700;
		assert: game eventHandler notNil
]
