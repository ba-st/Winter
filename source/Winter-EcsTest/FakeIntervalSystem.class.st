Class {
	#name : #FakeIntervalSystem,
	#superclass : #IntervalSystem,
	#instVars : [
		'updatesNumber'
	],
	#category : #'Winter-EcsTest-Test-Resources'
}

{ #category : #'Instance Creation' }
FakeIntervalSystem class >> withIntervalOf: aNumber [

	^ self new initializeWithIntervalOf: aNumber
]

{ #category : #initialization }
FakeIntervalSystem >> initialize [

	super initialize.
	updatesNumber := 0
]

{ #category : #initialization }
FakeIntervalSystem >> initializeWithIntervalOf: aNumber [

	interval := aNumber.
]

{ #category : #Updating }
FakeIntervalSystem >> updateIntervalBy: aDeltaTime [ 

	updatesNumber := updatesNumber +1
]

{ #category : #Accessing }
FakeIntervalSystem >> updatesNumber [

	^ updatesNumber
]
