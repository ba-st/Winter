"
I represent an abstract class for game schedulers

Collaborators: 

- process
- managedObject 

Public API and Key Messages

- process   
- name
- managedObject 
- startProcess
- terminateProcess.


"
Class {
	#name : #GameScheduler,
	#superclass : #Object,
	#instVars : [
		'process',
		'managedObject'
	],
	#category : #'Winter-Core-Schedulers'
}

{ #category : #'Instance Creation' }
GameScheduler class >> managing: anObject [

	^ self new initializeManaging: anObject
]

{ #category : #initialization }
GameScheduler >> initializeManaging: anObject [

	managedObject := anObject
]

{ #category : #accessing }
GameScheduler >> managedObject [

	^ managedObject
]

{ #category : #accessing }
GameScheduler >> name [

	^ ''
]

{ #category : #private }
GameScheduler >> newProcessAt: priority do: aBlock every: duration [
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
GameScheduler >> process [

	^ process
]

{ #category : #'Managing-Processes' }
GameScheduler >> startProcess [

	process resume
]

{ #category : #'Managing-Processes' }
GameScheduler >> terminateProcess [

	[ process terminate ] on: Error do: [ ].
]
