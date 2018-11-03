Class {
	#name : #WinterKeyboardEventHandler,
	#superclass : #WinterEventHandler,
	#instVars : [
		'screenModel'
	],
	#category : 'Winter-Core-Event-Handlers'
}

{ #category : #Accessing }
WinterKeyboardEventHandler >> screenModel [

	^ screenModel
]

{ #category : #Accessing }
WinterKeyboardEventHandler >> screenModel: anObject [

	screenModel := anObject
]

{ #category : #'as yet unclassified' }
WinterKeyboardEventHandler >> terminateProcesses [

	screenModel terminateProcesses
]

{ #category : #Accessing }
WinterKeyboardEventHandler >> visitKeyUpEvent: anEvent [

	screenModel handleKeyStroke: anEvent scanCode  
]
