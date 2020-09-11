Class {
	#name : #FakeEntitySystem,
	#superclass : #GameEntitySystem,
	#instVars : [
		'updatesNumber',
		'addedToEngine'
	],
	#category : #'Winter-EcsTest-Test-Resources'
}

{ #category : #Accessing }
FakeEntitySystem >> addedToEngine [

	^ addedToEngine
]

{ #category : #Utility }
FakeEntitySystem >> addedToEngine: anEngine [

	addedToEngine := true
]

{ #category : #initialization }
FakeEntitySystem >> initialize [

	updatesNumber := 0.
	addedToEngine := false
]

{ #category : #Utility }
FakeEntitySystem >> removedFromEngine: anEngine [

	addedToEngine := false
]

{ #category : #Updating }
FakeEntitySystem >> updateBy: aDeltaTime [

	updatesNumber := updatesNumber + 1
]

{ #category : #Accessing }
FakeEntitySystem >> updatesNumber [

	^ updatesNumber
]
