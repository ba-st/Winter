Class {
	#name : #SteppingSchedulerTest,
	#superclass : #TestCase,
	#instVars : [
		'scheduler',
		'updatedAndRendered'
	],
	#category : #'Winter-CoreTests-Schedulers'
}

{ #category : #running }
SteppingSchedulerTest >> setUp [

	super setUp.
	scheduler := SteppingScheduler managing: self.
	updatedAndRendered := false.
]

{ #category : #running }
SteppingSchedulerTest >> tearDown [

	super tearDown.
	scheduler terminateProcess.
	updatedAndRendered := false.
]

{ #category : #tests }
SteppingSchedulerTest >> testName [

	self assert: scheduler name equals: 'Upating and Rendering Scheduler Process'
]

{ #category : #tests }
SteppingSchedulerTest >> testPrinting [

	self assert: scheduler printString equals: scheduler name
]

{ #category : #tests }
SteppingSchedulerTest >> testProcessing [

	self deny: updatedAndRendered.

	scheduler startProcess.
	( Delay forMilliseconds: 50 ) wait.
	
	self assert: updatedAndRendered
]

{ #category : #support }
SteppingSchedulerTest >> updateAndRender [

	updatedAndRendered := true
]
