Class {
	#name : #AnimationsSchedulerTest,
	#superclass : #TestCase,
	#instVars : [
		'scheduler',
		'action1Done',
		'action2Done'
	],
	#category : #'Winter-CoreTests-Schedulers'
}

{ #category : #support }
AnimationsSchedulerTest >> doActionOne [

	action1Done := true
]

{ #category : #support }
AnimationsSchedulerTest >> doActionTwo [

	action2Done := true
]

{ #category : #support }
AnimationsSchedulerTest >> elementOne [

	^ 'Element 1'
]

{ #category : #support }
AnimationsSchedulerTest >> elementTwo [

	^ 'Element 2'
]

{ #category : #running }
AnimationsSchedulerTest >> setUp [

	super setUp.
	scheduler := AnimationsScheduler new.
	action1Done := false.
	action2Done := false
]

{ #category : #running }
AnimationsSchedulerTest >> tearDown [

	super tearDown.
	scheduler terminateProcess.
	scheduler
		stopGameTickActionFor: self elementOne;
		stopGameTickActionFor: self elementTwo.
	action1Done := false.
	action2Done := false
]

{ #category : #tests }
AnimationsSchedulerTest >> testExecuteActions [

	scheduler
		newGameTickAction: ( ConfigurableAnimation doing: [ self doActionOne ] every: 1 )
		for: self elementOne.
	scheduler
		newGameTickAction: ( ConfigurableAnimation doing: [ self doActionTwo ] every: 1 )
		for: self elementTwo.
	self
		deny: action1Done;
		deny: action2Done.

	scheduler executeAnimations.

	self
		assert: action1Done;
		assert: action2Done
]

{ #category : #tests }
AnimationsSchedulerTest >> testName [

	self assert: scheduler name equals: 'Animating Scheduler Process'
]

{ #category : #tests }
AnimationsSchedulerTest >> testPrinting [

	self assert: scheduler printString equals: scheduler name
]

{ #category : #tests }
AnimationsSchedulerTest >> testProcessing [

	scheduler
		newGameTickAction: ( ConfigurableAnimation doing: [ self doActionOne ] every: 1 )
		for: self elementOne.
	scheduler
		newGameTickAction: ( ConfigurableAnimation doing: [ self doActionTwo ] every: 1 )
		for: self elementTwo.
	self
		deny: action1Done;
		deny: action2Done.

	scheduler startProcess.
	( Delay forMilliseconds: 50 ) wait.

	self
		assert: action1Done;
		assert: action2Done
]
