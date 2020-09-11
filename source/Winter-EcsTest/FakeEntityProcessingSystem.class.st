Class {
	#name : #FakeEntityProcessingSystem,
	#superclass : #EntitiesProcessingSystem,
	#instVars : [
		'updatesNumberPerEntity',
		'updatesNumber'
	],
	#category : #'Winter-EcsTest-Test-Resources'
}

{ #category : #'Instance Creation' }
FakeEntityProcessingSystem class >> filteringWith: anEntityByComponentsFilter [

	^ self new initializeFilteringWith: anEntityByComponentsFilter
]

{ #category : #initialization }
FakeEntityProcessingSystem >> initialize [

	super initialize.
	updatesNumberPerEntity := Dictionary new.
	updatesNumber :=0
]

{ #category : #initialization }
FakeEntityProcessingSystem >> initializeFilteringWith: anEntityByComponentsFilter [

	filter := anEntityByComponentsFilter
]

{ #category : #Updating }
FakeEntityProcessingSystem >> process: anEntity using: aDeltaTime [

	| updatesNumber |

	updatesNumber := updatesNumberPerEntity at: anEntity ifAbsentPut: [ 0 ].

	updatesNumberPerEntity at: anEntity put: updatesNumber + 1
]

{ #category : #Updating }
FakeEntityProcessingSystem >> updateBy: aDeltaTime [

	updatesNumber := updatesNumber + 1.
	super updateBy: aDeltaTime
]

{ #category : #Accessing }
FakeEntityProcessingSystem >> updatesNumber [

	^ updatesNumber
]

{ #category : #Accessing }
FakeEntityProcessingSystem >> updatesNumberForEntity: anEntity [

	^ updatesNumberPerEntity at: anEntity ifAbsentPut: [ 0 ]
]
