Class {
	#name : #WinterGameTest,
	#superclass : #TestCase,
	#instVars : [
		'game'
	],
	#category : 'Winter-CoreTests'
}

{ #category : #finalization }
WinterGameTest >> tearDown [

	[ game scheduler terminateProcess.
	game screen scheduler terminateProcess
	]
		on: Error
		do: [  ]
]

{ #category : #tests }
WinterGameTest >> testAccessing [

	| scene |

	scene := Winter2DScene new.
	game := WinterGame new.
	game
		scene: scene;
		dimensions: 650 @ 700;
		title: 'Test'.


	self
		assert: game scene equals: scene;
		assert: game dimensions equals: 650 @ 700;
		assert: game title equals: 'Test'
]
