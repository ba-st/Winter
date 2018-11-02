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
	game screen scheduler terminateProcess ]
		on: Error
		do: [  ]
]

{ #category : #tests }
WinterGameTest >> testAccessing [


	game := WinterTestGame new.


	self
		assert: (game scene isKindOf: WinterTestScene);
		assert: game dimensions equals: 650@700;
		assert: game stepTime equals: 30;
		assert: game title equals: 'Test'
]
