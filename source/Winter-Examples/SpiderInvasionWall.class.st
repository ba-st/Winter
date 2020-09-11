"
I represent a wall as an obstacle in the spider invasion scene

"
Class {
	#name : #SpiderInvasionWall,
	#superclass : #SpiderInvasionItem,
	#category : #'Winter-Examples-SpiderInvasion'
}

{ #category : #'Instance Creation' }
SpiderInvasionWall class >> inPosition: aPosition of: aGame [

	^ self new initializeInPosition: aPosition of: aGame
]

{ #category : #initialization }
SpiderInvasionWall >> initializeInPosition: aPosition of: aGame [

	game := aGame.
	collisionShape := Square ofCenter: aPosition extent: self spriteSize color: Color black.
	sprite := game assetsManager  assetNamed: #wall
]
