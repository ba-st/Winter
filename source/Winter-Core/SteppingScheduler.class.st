"
I represent a scheduler to manage update and render of the game

Collaborators: 

- managedObject

Public API and Key Messages:
   

"
Class {
	#name : #SteppingScheduler,
	#superclass : #GameScheduler,
	#instVars : [
		'managedObject'
	],
	#category : #'Winter-Core-Schedulers'
}

{ #category : #'Instance Creation' }
SteppingScheduler class >> managing: anObject [

	^ self new initializeManaging: anObject
]

{ #category : #initialization }
SteppingScheduler >> initialize [

	super initialize.
	process := self newProcessAt: 30 do: [ managedObject  updateAndRender ] every: self minTimeBetweenRendering.
]

{ #category : #initialization }
SteppingScheduler >> initializeManaging: anObject [

	managedObject := anObject
]

{ #category : #initialization }
SteppingScheduler >> maxFrameRate [ 

	^ 50 "fps"
]

{ #category : #initialization }
SteppingScheduler >> minTimeBetweenRendering [
	
	^ (1000 "ms" / self maxFrameRate) milliSeconds 
]

{ #category : #Accessing }
SteppingScheduler >> name [

	^ 'Upating and Rendering Scheduler Process'
]
