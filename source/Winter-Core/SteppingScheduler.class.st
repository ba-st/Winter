"
I represent a scheduler to manage update and render of the game

Collaborators: 


Public API and Key Messages:
   

"
Class {
	#name : #SteppingScheduler,
	#superclass : #GameScheduler,
	#category : #'Winter-Core-Schedulers'
}

{ #category : #initialization }
SteppingScheduler >> initialize [

	super initialize.
	process := self newProcessAt: 30 do: [ managedObject  updateAndRender ] every: self minTimeBetweenRendering.
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
