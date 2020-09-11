"
I represent a handler used to handle keyword events on screens

Collaborators: 

- screenModel

Public API and Key Messages:

- screenModel
- screenModel:
- terminateProcesses
- visitKeyUpEvent:
"
Class {
	#name : #KeyboardEventHandler,
	#superclass : #BasicEventHandler,
	#instVars : [
		'screenModel'
	],
	#category : #'Winter-Core-Event-Handlers'
}

{ #category : #processing }
KeyboardEventHandler >> printOn: aStream [

	aStream nextPutAll: 'Screen keywords events handler'
]

{ #category : #Accessing }
KeyboardEventHandler >> screenModel [

	^ screenModel
]

{ #category : #Accessing }
KeyboardEventHandler >> screenModel: anObject [

	screenModel := anObject
]

{ #category : #processing }
KeyboardEventHandler >> terminateProcesses [

	screenModel terminateProcesses
]

{ #category : #visiting }
KeyboardEventHandler >> visitKeyUpEvent: anEvent [

	screenModel handleKeyStroke: anEvent scanCode  
]
