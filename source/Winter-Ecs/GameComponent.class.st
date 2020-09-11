Class {
	#name : #GameComponent,
	#superclass : #Object,
	#category : #'Winter-Ecs'
}

{ #category : #Testing }
GameComponent >> isOfType: aClass [

	^ self class = aClass
]
