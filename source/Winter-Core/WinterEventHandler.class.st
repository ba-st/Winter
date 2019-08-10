"
I represent an Abstract class for os event handler

Collaborators: 


Public API and Key Messages:

- terminateProcesses
- visitWindowCloseEvent:
"
Class {
	#name : #WinterEventHandler,
	#superclass : #OSWindowEventVisitor,
	#category : #'Winter-Core-Event-Handlers'
}

{ #category : #processing }
WinterEventHandler >> terminateProcesses [

	self subclassResponsibility
]

{ #category : #visiting }
WinterEventHandler >> visitWindowCloseEvent: anEvent [
	self terminateProcesses.
	"Smalltalk snapshot: false andQuit: true"
	
]
