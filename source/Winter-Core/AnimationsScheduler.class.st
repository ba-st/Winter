"
I represent a scheduler to manage animations in the game

Collaborators: 

- gameStepActions

Public API and Key Messages
   
- name
- newGameTickAction:for: 
- stopGameTickAction:for:.


"
Class {
	#name : #AnimationsScheduler,
	#superclass : #GameScheduler,
	#instVars : [
		'gameStepActions'
	],
	#category : #'Winter-Core-Schedulers'
}

{ #category : #Accessing }
AnimationsScheduler >> animationStepTime [

	^ 20 milliSeconds
]

{ #category : #initialization }
AnimationsScheduler >> executeAnimations [

	^ gameStepActions keysAndValuesDo: [ :element :animation | animation animate ]
]

{ #category : #initialization }
AnimationsScheduler >> initialize [

	super initialize.

	gameStepActions := Dictionary new.
	process := self 
		newProcessAt: 35 
		do: [ self executeAnimations ]
		every: self animationStepTime.
]

{ #category : #Accessing }
AnimationsScheduler >> name [

	^ 'Animating Scheduler Process'
]

{ #category : #'Managing-Processes' }
AnimationsScheduler >> newGameTickAction: aBlock for: element [

	gameStepActions  at: element put: aBlock
]

{ #category : #'Managing-Processes' }
AnimationsScheduler >> stopGameTickActionFor: element [ 

	gameStepActions  removeKey: element ifAbsent: [ "Do nothing" ]
]
