Class {
	#name : #ArkanoidScene,
	#superclass : #Winter2DScene,
	#category : #'Winter-Examples-Arkanoid'
}

{ #category : #Accessing }
ArkanoidScene >> backgroundColor [

	^ game assetsManagementSystem assetNamed: 'background'
]

{ #category : #initialization }
ArkanoidScene >> initializeComponents [

	self
		addComponent: ArkanoidBall new;
		addComponent: (ArkanoidWall ofCenter: 0 @ 0 extent: 626 @ 0 andColor: Color white);
		addComponent: (ArkanoidWall ofCenter: 0 @ 0 extent: 0 @ 600 andColor: Color white);
		addComponent: (ArkanoidWall ofCenter: 600 @ 0 extent: 0 @ 600 andColor: Color white);
		addComponent: (ArkanoidBlock yellowOn: 150 @ 150 ofExtent: 50 @ 25 );
		addComponent: (ArkanoidBlock greenOn: 210 @ 150 ofExtent: 50 @ 25 );
		addComponent: (ArkanoidBlock redOn: 90 @ 150 ofExtent: 50 @ 25 )
		
		
]

{ #category : #Accessing }
ArkanoidScene >> player [

	^players anyOne
]
