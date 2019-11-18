"
I represent a missile fired from the spaceShipe


Public API and Key Messages:

- action
"
Class {
	#name : #SpiderInvasionMissile,
	#superclass : #SpiderInvasionAnimatedItem,
	#category : #'Winter-Examples-SpiderInvasion'
}

{ #category : #'instance creation' }
SpiderInvasionMissile class >> atPosition: aPosition of: aScene tick: numberOfTicks [

	^ self new initializeAtPosition: aPosition of: aScene tick: numberOfTicks
]

{ #category : #Actions }
SpiderInvasionMissile >> action [

	self y = scene minY
		ifTrue: [ scene player reload.
			scene removeComponent: self
			]
		ifFalse: [ self position: self position - ( 0 @ 1 ) ]
]

{ #category : #initialization }
SpiderInvasionMissile >> initializeAtPosition: aPosition of: aScene tick: numberOfTicks [

	scene := aScene.
	game := scene game.
	collisionShape := Winter2DCircle
		ofCenter: aPosition
		radius: self spriteSize x
		color: Color white
		in: self game.
	self tick: numberOfTicks
]

{ #category : #initialization }
SpiderInvasionMissile >> initializeSprite [

	sprite := game assetsManagementSystem assetNamed: #missile
]
