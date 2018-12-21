"
Abstract class for event handler
"
Class {
	#name : #WinterEventHandler,
	#superclass : #OSWindowEventVisitor,
	#category : #'Winter-Core-Event-Handlers'
}

{ #category : #'as yet unclassified' }
WinterEventHandler >> terminateProcesses [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
WinterEventHandler >> visitWindowCloseEvent: anEvent [
	self terminateProcesses.
	"Smalltalk snapshot: false andQuit: true"
	
]
