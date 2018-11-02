Class {
	#name : #SpiderInvasionMissile,
	#superclass : #SpiderInvasionAnimatedItem,
	#category : 'Winter-Examples-SpiderInvasion'
}

{ #category : #'instance creation' }
SpiderInvasionMissile class >> atPosition: aPosition of: aScene tick: numberOfTicks [

	^ self new initializeAtPosition: aPosition of: aScene tick: numberOfTicks
]

{ #category : #Actions }
SpiderInvasionMissile >> action [

	self y = scene minY
		ifTrue: [  scene removeComponent: self. scene player reload ]
		ifFalse: [ self position: self position - (0 @ 24) ]
]

{ #category : #initialization }
SpiderInvasionMissile >> initializeAtPosition: aPosition of: aScene tick: numberOfTicks [

	scene := aScene.
	game := scene game.
	collisionShape := Winter2DSquare
		ofCenter: aPosition
		extent: self  spriteSize
		color: Color white
		in: self game.
	self tick: numberOfTicks
]

{ #category : #initialization }
SpiderInvasionMissile >> initializeSprite [

	sprite := WinterAssetManagementSystem current spriteNamed: #missile
]

{ #category : #Collision }
SpiderInvasionMissile >> missileEnter: missile [

]

{ #category : #Collision }
SpiderInvasionMissile >> spiderEnter: spider [
]
