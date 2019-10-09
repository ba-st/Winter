"
I represent the spider invasion scene. I contain all the components of the game.

Public API and Key Messages:

- background
- isOccupiedAt:
- isValidPosition:
- lostGame
- maxX
- maxY
- minX
- minY
- newRandomSpiderTicked:
"
Class {
	#name : #SpiderInvesionScene,
	#superclass : #Winter2DScene,
	#category : #'Winter-Examples-SpiderInvasion'
}

{ #category : #accessing }
SpiderInvesionScene >> background [

	^ Color black
]

{ #category : #initialization }
SpiderInvesionScene >> initializeComponents [

	self initializeWalls.
	self initializeSpiders.
]

{ #category : #initialization }
SpiderInvesionScene >> initializeSpiders [

	"Only half of the boxes in the first row contain a spider at the start of the game."
	1 to: self maxX // 2 do: [ :i |
		self newRandomSpiderTicked: self maxX + 10 + 20 atRandom ]
]

{ #category : #initialization }
SpiderInvesionScene >> initializeWalls [
	self withIndexItemsDo: [ :x :y |
		(y = self minY or: [y = self maxY]) ifFalse: [ 
			100 atRandom < 20 ifTrue: [ "20% of chances"
				self addComponent: (SpiderInvasionWall inPosition: x@y of: self ) ] ] ]
]

{ #category : #Testing }
SpiderInvesionScene >> isOccupiedAt: aPosition [

	^self components anySatisfy: [ :component | component position = aPosition ]
]

{ #category : #Testing }
SpiderInvesionScene >> isValidPosition: aPosition [

	^ self minX @ self minY <= aPosition and: [ aPosition <= (self maxX @ self maxY)  ]
]

{ #category : #Processing }
SpiderInvesionScene >> lostGame [
	components := OrderedCollection new.
	self
		withIndexItemsDo: [ :i :j | 
			j = self maxY
				ifFalse: [ self addComponent: (SpiderInvasionExplode atPosition: i @ j of: self tick: 30) ] ]
]

{ #category : #accessing }
SpiderInvesionScene >> maxX [

	^ 8
]

{ #category : #accessing }
SpiderInvesionScene >> maxY [

	^ 14
]

{ #category : #accessing }
SpiderInvesionScene >> minX [

	^ 1
]

{ #category : #accessing }
SpiderInvesionScene >> minY [

	^ 1
]

{ #category : #private }
SpiderInvesionScene >> newRandomSpiderTicked:  numTick [

	| randomX spider |
	
	[randomX := self randomX.
	self isOccupiedAt: randomX @1] whileTrue .
	spider := SpiderInvasionSpider atPosition: randomX @ self minY of: self tick: numTick.
	self addComponent: spider.
]

{ #category : #private }
SpiderInvesionScene >> randomX [
	^ self maxX atRandom - 1 + self minX
]

{ #category : #private }
SpiderInvesionScene >> withIndexItemsDo: aBlock [

	self minY to: self maxY do: [ :j |
		self minX to: self maxX do: [ :i |
			aBlock value: i value: j ] ]
]
