Class {
	#name : #SpiderInvasionExplode,
	#superclass : #SpiderInvasionAnimatedItem,
	#category : 'Winter-Examples-SpiderInvasion'
}

{ #category : #accessing }
SpiderInvasionExplode class >> atPosition: aPosition of: aScene tick: numberOfTicks [

	^ self new initializeAtPosition: aPosition of: aScene tick: numberOfTicks
]

{ #category : #Actions }
SpiderInvasionExplode >> action [

	game scene removeComponent: self
]

{ #category : #initialization }
SpiderInvasionExplode >> initializeAtPosition: aPosition of: aScene tick: numberOfTicks [

	scene := aScene.
	game := scene game.
	collisionShape := Winter2DSquare
		ofCenter: aPosition
		extent: self  spriteSize
		color: Color black
		in: self game.
	self tick: numberOfTicks
]

{ #category : #initialization }
SpiderInvasionExplode >> initializeSprite [

	sprite := WinterAssetManagementSystem current spriteNamed: #explode
]
