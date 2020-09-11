Class {
	#name : #GameEntitySystem,
	#superclass : #Object,
	#category : #'Winter-Ecs'
}

{ #category : #Utility }
GameEntitySystem >> addedToEngine: anEngine [
]

{ #category : #Utility }
GameEntitySystem >> notifiedOfEngineAddingEntity: anEntity [
]

{ #category : #Utility }
GameEntitySystem >> removedFromEngine: anEngine [
]

{ #category : #Updating }
GameEntitySystem >> updateBy: aDeltaTime [

	self subclassResponsibility
]
