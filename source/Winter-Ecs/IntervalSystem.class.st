Class {
	#name : #IntervalSystem,
	#superclass : #GameEntitySystem,
	#instVars : [
		'interval',
		'accumulator'
	],
	#category : #'Winter-Ecs'
}

{ #category : #initialization }
IntervalSystem >> initialize [

	interval := 0.
	accumulator := 0
]

{ #category : #accessing }
IntervalSystem >> interval [

	^ interval
]

{ #category : #accessing }
IntervalSystem >> interval: aFloat [

	interval := aFloat
]

{ #category : #Updating }
IntervalSystem >> updateBy: aDeltaTime [

	accumulator := accumulator + aDeltaTime.

	[ accumulator >= interval ]
		whileTrue: [ accumulator := accumulator - interval.
			self updateIntervalBy: aDeltaTime
			]
]

{ #category : #Updating }
IntervalSystem >> updateIntervalBy: aDeltaTime [ 

	self subclassResponsibility
]
