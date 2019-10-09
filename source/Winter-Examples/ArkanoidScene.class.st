"
I represent the arkanoid scene of the game,
i own all the components living in the game

Public API and Key Messages:

- background
- player
"
Class {
	#name : #ArkanoidScene,
	#superclass : #Winter2DScene,
	#category : #'Winter-Examples-Arkanoid'
}

{ #category : #Accessing }
ArkanoidScene >> background [

	^ game assetsManagementSystem assetNamed: 'background'
]

{ #category : #initialization }
ArkanoidScene >> initializeComponents [

	self
		addComponent: ArkanoidBall new;
		addComponent: (ArkanoidWall ofCenter: 0 @ 0 extent: 626 @ 0 andColor: Color white);
		addComponent: (ArkanoidWall ofCenter: 0 @ 0 extent: 0 @ 600 andColor: Color white);
		addComponent: (ArkanoidWall ofCenter: 600 @ 0 extent: 0 @ 600 andColor: Color white);
		addComponent: (ArkanoidBrick yellowOn: 150 @ 150 ofExtent: 50 @ 25 );
		addComponent: (ArkanoidBrick greenOn: 210 @ 150 ofExtent: 50 @ 25 );
		addComponent: (ArkanoidBrick redOn: 90 @ 150 ofExtent: 50 @ 25 )
		
		
]

{ #category : #Accessing }
ArkanoidScene >> player [

	^players anyOne
]
