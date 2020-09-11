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
SpiderInvasionSpider class >> atPosition: aPosition of: aGame tick: numberOfTicks [

	^ self new initializeAtPosition: aPosition of: aGame tick: numberOfTicks
]

{ #category : #Actions }
SpiderInvasionSpider >> action [

	self y = game maxY
		ifTrue: [ game lostGame ]
		ifFalse: [ self position: self position + ( 0 @ 1 ) ]
]

{ #category : #Collisions }
SpiderInvasionSpider >> checkCollisions [

	game actors
		do: [ :actor | 
			actor = self
				ifFalse: [ actor position = self position
						ifTrue: [ ( CollisionOcurred between: self and: actor ) signal ]
					]
			]
]

{ #category : #Actions }
SpiderInvasionSpider >> die [

	scene newRandomSpiderTicked: ( tick - 1 max: 8 ).
	super die
]

{ #category : #initialization }
SpiderInvasionSpider >> initializeAtPosition: aPosition of: aGame tick: numberOfTicks [

	game := aGame.
	sprite := game assetsManager  assetNamed: #spider.
	collisionShape := Square ofCenter: aPosition extent: self spriteSize color: Color black.
	self tick: numberOfTicks
]
