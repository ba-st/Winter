"
I am an abstract class for components in the arena

Instance variables: 

- shift 
- negatedShift

Public API and Key Messages:

- cellSize
- initialShift
- movingShift
- shift
- shift:
- shiftBy:

"
Class {
	#name : #WBAArenaComponent,
	#superclass : #WinterWidget,
	#instVars : [
		'shift',
		'negatedShift'
	],
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #Accessing }
WBAArenaComponent >> cellSize [
	^ 48@32
]

{ #category : #Accessing }
WBAArenaComponent >> movingShift [
	^ shift - self initialShift
]

{ #category : #Accessing }
WBAArenaComponent >> numberOfAnimationFrame [
	^ 16
]

{ #category : #Accessing }
WBAArenaComponent >> shift [
	^ shift
]

{ #category : #Accessing }
WBAArenaComponent >> shift: anObject [
	shift := anObject.
	negatedShift := shift negated.
]

{ #category : #Accessing }
WBAArenaComponent >> shiftBy: incr [
	self shift: shift - incr
]
