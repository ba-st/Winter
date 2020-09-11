Class {
	#name : #SteppingSchedulerTest,
	#superclass : #TestCase,
	#instVars : [
		'scheduler'
	],
	#category : #'Winter-CoreTests-Schedulers'
}

{ #category : #running }
SteppingSchedulerTest >> setUp [

	super setUp.
	scheduler := SteppingScheduler managing: self.
]

{ #category : #running }
SteppingSchedulerTest >> tearDown [

	super tearDown.
	scheduler terminateProcess
]

{ #category : #running }
SteppingSchedulerTest >> testName [

	self assert: scheduler name equals: 'Upating and Rendering Scheduler Process'
]

{ #category : #running }
SteppingSchedulerTest >> testPrinting [

	self assert: scheduler printString equals: scheduler name
]
