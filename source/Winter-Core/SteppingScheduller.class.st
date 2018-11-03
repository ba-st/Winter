Class {
	#name : #SteppingScheduller,
	#superclass : #GameScheduller,
	#category : 'Winter-Core-Schedulers'
}

{ #category : #initialization }
SteppingScheduller >> initialize [

	super initialize.
	process := self newProcessAt: 30 do: [ managedObject  updateAndRender ] every: self minTimeBetweenRendering.
]

{ #category : #initialization }
SteppingScheduller >> maxFrameRate [ 

	^ 50 "fps"
]

{ #category : #initialization }
SteppingScheduller >> minTimeBetweenRendering [
	
	^ (1000 "ms" / self maxFrameRate) milliSeconds 
]

{ #category : #Accessing }
SteppingScheduller >> name [

	^ 'Upating and Rendering Scheduler Process'
]
