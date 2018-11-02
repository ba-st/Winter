Class {
	#name : #GameScheduller,
	#superclass : #Object,
	#instVars : [
		'process',
		'managedObject'
	],
	#category : 'Winter-Core-Schedulers'
}

{ #category : #'Instance Creation' }
GameScheduller class >> managing: anObject [

	^ self new initializeManaging: anObject
]

{ #category : #initialization }
GameScheduller >> initializeManaging: anObject [

	managedObject := anObject
]

{ #category : #accessing }
GameScheduller >> managedObject [

	^ managedObject
]

{ #category : #accessing }
GameScheduller >> name [

	^ ''
]

{ #category : #private }
GameScheduller >> newProcessAt: priority do: aBlock every: duration [
	^ [ 
		[ | time delay |
		time := DateAndTime now.
		aBlock value.
		delay := duration - (DateAndTime now - time).
		delay negative 
			ifFalse: [ delay wait ]
			ifTrue: [ "slowing process" ]
		 ] repeat ] forkAt: priority
]

{ #category : #accessing }
GameScheduller >> process [

	^ process
]

{ #category : #'Managing-Processes' }
GameScheduller >> startProcess [

	process resume
]

{ #category : #'Managing-Processes' }
GameScheduller >> terminateProcess [

	[ process terminate ] on: Error do: [ ].
]
