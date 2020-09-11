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
SpiderInvasionMissile class >> atPosition: aPosition of: aGame tick: numberOfTicks [

	^ self new initializeAtPosition: aPosition of: aGame tick: numberOfTicks
]

{ #category : #Actions }
SpiderInvasionMissile >> action [

	self y = game minY
		ifTrue: [ game player reload.
			self die
			]
		ifFalse: [ self position: self position - ( 0 @ 1 ) ]
]

{ #category : #initialization }
SpiderInvasionMissile >> initializeAtPosition: aPosition of: aGame tick: numberOfTicks [

	game := aGame.
	sprite := game assetsManager assetNamed: #missile.
	collisionShape := Circle ofCenter: aPosition radius: self spriteSize x color: Color white.
	self tick: numberOfTicks
]
