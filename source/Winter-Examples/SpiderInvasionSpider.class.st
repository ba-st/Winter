"
I represent an enemy spider in the spider invasion scene

Public API and Key Messages:

- action
- checkCollisions
- die
"
Class {
	#name : #SpiderInvasionSpider,
	#superclass : #SpiderInvasionAnimatedItem,
	#category : #'Winter-Examples-SpiderInvasion'
}

{ #category : #accessing }
SpiderInvasionSpider class >> atPosition: aPosition of: aScene tick: numberOfTicks [

	^ self new initializeAtPosition: aPosition of: aScene tick: numberOfTicks
]

{ #category : #Actions }
SpiderInvasionSpider >> action [
	self y = scene   maxY
		ifTrue: [ scene lostGame ]
		ifFalse: [ self position:self position + (0@1)]
	
	
]

{ #category : #Collisions }
SpiderInvasionSpider >> checkCollisions [

	scene components
		do: [ :component | 
			component = self
				ifFalse: [ component position = self position
						ifTrue: [ (Collision between: self and: component) applyOnGame ] ] ]
]

{ #category : #Actions }
SpiderInvasionSpider >> die [
	scene newRandomSpiderTicked: (tick - 1 max: 8).
	super die
]

{ #category : #initialization }
SpiderInvasionSpider >> initializeAtPosition: aPosition of: aScene tick: numberOfTicks [

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
SpiderInvasionSpider >> initializeSprite [

	sprite := game assetsManagementSystem  assetNamed: #spider
]
