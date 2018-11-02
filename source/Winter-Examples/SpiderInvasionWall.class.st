Class {
	#name : #SpiderInvasionWall,
	#superclass : #SpiderInvasionItem,
	#category : 'Winter-Examples-SpiderInvasion'
}

{ #category : #'as yet unclassified' }
SpiderInvasionWall class >> inPosition: aPosition of: aSene [

	^ self new initializeInPosition: aPosition of: aSene
]

{ #category : #initialization }
SpiderInvasionWall >> initializeInPosition: aPosition of: aSene [

	 scene := aSene.
	game := scene game.
	collisionShape := Winter2DSquare
		ofCenter: aPosition
		extent: self spriteSize 
		color: Color black
		in: self game
]

{ #category : #initialization }
SpiderInvasionWall >> initializeSprite [

	sprite := WinterAssetManagementSystem current spriteNamed: #wall
]
