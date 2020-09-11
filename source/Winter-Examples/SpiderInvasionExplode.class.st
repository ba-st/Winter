"
I represent an explosion to cover scene when game is over


Public API and Key Messages:

- action
"
Class {
	#name : #SpiderInvasionExplode,
	#superclass : #SpiderInvasionAnimatedItem,
	#category : #'Winter-Examples-SpiderInvasion'
}

{ #category : #accessing }
SpiderInvasionExplode class >> atPosition: aPosition of: aGame tick: numberOfTicks [

	^ self new initializeAtPosition: aPosition of: aGame tick: numberOfTicks
]

{ #category : #Actions }
SpiderInvasionExplode >> action [

	self die
]

{ #category : #initialization }
SpiderInvasionExplode >> initializeAtPosition: aPosition of: aGame tick: numberOfTicks [

	game := aGame.
	sprite := game assetsManager assetNamed: #explode.
	collisionShape := Square ofCenter: aPosition extent: self spriteSize color: Color black.
	self tick: numberOfTicks
]
