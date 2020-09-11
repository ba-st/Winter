"
I represent an abstract class for game schedulers

Collaborators: 

- process 

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
		'process'
	],
	#category : #'Winter-Core-Schedulers'
}

{ #category : #accessing }
GameScheduler >> name [

	^ ''
]

{ #category : #private }
GameScheduler >> newProcessAt: priority do: aBlock every: duration [

	^ [ [ | time delay |

	time := DateAndTime now.
	aBlock value.
	delay := duration - ( DateAndTime now - time ).
	delay negative
		ifFalse: [ delay wait ]
		ifTrue: [ "slowing process" ]
	] repeat
	] newProcess
		priority: priority;
		yourself
]

{ #category : #printing }
GameScheduler >> printOn: aStream [

aStream nextPutAll: self name
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
