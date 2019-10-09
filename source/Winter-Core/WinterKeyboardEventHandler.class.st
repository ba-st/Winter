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
	#name : #WinterKeyboardEventHandler,
	#superclass : #WinterEventHandler,
	#instVars : [
		'screenModel'
	],
	#category : #'Winter-Core-Event-Handlers'
}

{ #category : #processing }
WinterKeyboardEventHandler >> printOn: aStream [

	aStream nextPutAll: 'Screen keywords events handler'
]

{ #category : #Accessing }
WinterKeyboardEventHandler >> screenModel [

	^ screenModel
]

{ #category : #Accessing }
WinterKeyboardEventHandler >> screenModel: anObject [

	screenModel := anObject
]

{ #category : #processing }
WinterKeyboardEventHandler >> terminateProcesses [

	screenModel terminateProcesses
]

{ #category : #visiting }
WinterKeyboardEventHandler >> visitKeyUpEvent: anEvent [

	screenModel handleKeyStroke: anEvent scanCode  
]
