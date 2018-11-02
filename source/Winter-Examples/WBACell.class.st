Class {
	#name : #WBACell,
	#superclass : #WBAArenaComponent,
	#instVars : [
		'ground',
		'element',
		'spells',
		'neighbours'
	],
	#category : 'Winter-Examples-WizardBattle'
}

{ #category : #accessing }
WBACell >> element [
	^ element
]

{ #category : #accessing }
WBACell >> element: anObject [
	element := anObject
]

{ #category : #accessing }
WBACell >> ground [
	^ ground
]

{ #category : #accessing }
WBACell >> ground: anObject [
	ground := anObject
]

{ #category : #initialization }
WBACell >> initialize [
	super initialize.
	spells := OrderedCollection new
]

{ #category : #accessing }
WBACell >> neighbours [
	^ neighbours
]

{ #category : #accessing }
WBACell >> neighbours: anObject [
	neighbours := anObject
]

{ #category : #accessing }
WBACell >> spells [
	^ spells
]

{ #category : #accessing }
WBACell >> spells: anObject [
	spells := anObject
]
