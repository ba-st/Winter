Class {
	#name : #AnimationsSchedulerTest,
	#superclass : #TestCase,
	#instVars : [
		'scheduler'
	],
	#category : #'Winter-CoreTests-Schedulers'
}

{ #category : #running }
AnimationsSchedulerTest >> setUp [

	super setUp.
	scheduler := AnimationsScheduler new
]

{ #category : #running }
AnimationsSchedulerTest >> tearDown [

	super tearDown.
	scheduler terminateProcess
]

{ #category : #running }
AnimationsSchedulerTest >> testName [

	self assert: scheduler name equals: 'Animating Scheduler Process'
]

{ #category : #running }
AnimationsSchedulerTest >> testPrinting [

	self assert: scheduler printString equals: scheduler name
]
