Class {
	#name : #EntitiesProcessingSystem,
	#superclass : #GameEntitySystem,
	#instVars : [
		'entities',
		'filter'
	],
	#category : #'Winter-Ecs'
}

{ #category : #Utility }
EntitiesProcessingSystem >> addedToEngine: anEngine [

	entities := anEngine entitiesSatisfying: filter
]

{ #category : #accessing }
EntitiesProcessingSystem >> entities [

	^ entities copy
]

{ #category : #accessing }
EntitiesProcessingSystem >> filter [

	^ filter
]

{ #category : #initialization }
EntitiesProcessingSystem >> initialize [

	entities := Set new
]

{ #category : #Utility }
EntitiesProcessingSystem >> notifiedOfEngineAddingEntity: anEntity [

	( filter isSatisfiedBy: anEntity )
		ifTrue: [ entities add: anEntity ]
]

{ #category : #Updating }
EntitiesProcessingSystem >> process: anEntity using: aDeltaTime [

	self subclassResponsibility
]

{ #category : #Utility }
EntitiesProcessingSystem >> removedFromEngine: anEngine [

	entities := Set new
]

{ #category : #Updating }
EntitiesProcessingSystem >> updateBy: aDeltaTime [

	entities do: [ :entity | self process: entity using: aDeltaTime ]
]
