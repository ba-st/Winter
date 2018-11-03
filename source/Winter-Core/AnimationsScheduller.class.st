Class {
	#name : #AnimationsScheduller,
	#superclass : #GameScheduller,
	#instVars : [
		'gameStepActions'
	],
	#category : 'Winter-Core-Schedulers'
}

{ #category : #Accessing }
AnimationsScheduller >> animationStepTime [

	^ 20 milliSeconds
]

{ #category : #initialization }
AnimationsScheduller >> executeAnimations [

	^ gameStepActions keysAndValuesDo: [ :element :animation | animation animate ]
]

{ #category : #initialization }
AnimationsScheduller >> initialize [

	super initialize.

	gameStepActions := Dictionary new.
	process := self 
		newProcessAt: 35 
		do: [ gameStepActions keysAndValuesDo: [ :element :animation |
			animation animate ] ]
		every: self animationStepTime.
]

{ #category : #Accessing }
AnimationsScheduller >> name [

	^ 'Animating Scheduler Process'
]

{ #category : #'Managing-Processes' }
AnimationsScheduller >> newGameTickAction: aBlock for: element [

	gameStepActions  at: element put: aBlock
]

{ #category : #'Managing-Processes' }
AnimationsScheduller >> stopGameTickActionFor: element [ 

	gameStepActions  removeKey: element ifAbsent: [ "Do nothing" ]
]
