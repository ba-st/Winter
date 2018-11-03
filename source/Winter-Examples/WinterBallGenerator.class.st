"
I generate a number of randomized balls at a fixed rate (a fixed number every so many animation steps). Once my preset number of balls has been generated, I conclude the series with one heavy ball.

Instance Variables:

balls
	number of balls to generate

ballsGenerated
	number of balls generated up to now

ballsPerStep
	how many balls I should generate per animation period

startX
	approximate horizontal position where the balls should be generated

stepCounter
	incremented after each call to #eventUpdated: and counted to know when to generate the next batch of ballsPerStep balls
"
Class {
	#name : #WinterBallGenerator,
	#superclass : #WinterComponent,
	#instVars : [
		'balls',
		'ballsGenerated',
		'stepCounter',
		'ballsPerStep',
		'startX'
	],
	#category : 'Winter-Examples-Resources'
}

{ #category : #defaults }
WinterBallGenerator class >> defaultBalls [ 
	^100
]

{ #category : #defaults }
WinterBallGenerator class >> defaultStartX [
	^350
]

{ #category : #accessing }
WinterBallGenerator >> balls [
	^ balls ifNil: [ balls := self class defaultBalls ]
]

{ #category : #accessing }
WinterBallGenerator >> balls: anObject [
	balls := anObject
]

{ #category : #private }
WinterBallGenerator >> createBallShape [
	^WinterBallShapeNoPhysics  new
		radius: 6 + (9 atRandom);
		color: Color random;
		yourself
]

{ #category : #private }
WinterBallGenerator >> createHeavyBallShape [
	^WinterHeavyBallShapeNoPhysics  new
		color: Color gray;
		yourself
]

{ #category : #events }
WinterBallGenerator >> eventUpdated: anEvent [
	ballsGenerated = self balls ifTrue: [ ^self ].
	
	stepCounter % 10 = 0
		ifTrue: [  
			anEvent scene 
				addComponents: ((1 to: ballsPerStep) collect: [ :i | 
					self createBallShape
						position: (self startX + 5 atRandom)@(20 - (30 * i)) ]).
			ballsGenerated := ballsGenerated + ballsPerStep.
			ballsGenerated = self balls 
				ifTrue: [ 
					anEvent scene
						addComponent: (self createHeavyBallShape 
							position: self startX - (WinterHeavyBallShape defaultRadius / 2) @ -1000) ] ].
	stepCounter := stepCounter + 1.
]

{ #category : #initialization }
WinterBallGenerator >> initialize [
	super initialize.
	stepCounter := 1.
	ballsGenerated := 0.
	ballsPerStep := 5.
	
]

{ #category : #accessing }
WinterBallGenerator >> startX [
	^startX ifNil: [ startX := self class defaultStartX ]
]

{ #category : #accessing }
WinterBallGenerator >> startX: aNumber [
	startX := aNumber
]
