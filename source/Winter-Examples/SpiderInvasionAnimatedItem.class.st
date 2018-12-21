Class {
	#name : #SpiderInvasionAnimatedItem,
	#superclass : #SpiderInvasionItem,
	#instVars : [
		'tick',
		'currentTick'
	],
	#category : #'Winter-Examples-SpiderInvasion'
}

{ #category : #Actions }
SpiderInvasionAnimatedItem >> action [
	self subclassResponsibility 
]

{ #category : #Actions }
SpiderInvasionAnimatedItem >> doTick [
	currentTick := currentTick - 1.
	currentTick = 0 ifTrue: [ self action. currentTick := tick ].
]

{ #category : #Accessing }
SpiderInvasionAnimatedItem >> tick [
	^ tick
]

{ #category : #Accessing }
SpiderInvasionAnimatedItem >> tick: anObject [
	currentTick := tick := anObject.
	
]

{ #category : #Events }
SpiderInvasionAnimatedItem >> updateUsing: aCanvas [

	self doTick.
	super updateUsing: aCanvas
]
