"
I represent a descriptor of how the arena will be like


Public API and Key Messages:

- cellDescriptors
- cellDescriptors:
- dispatchIndex:on:with:
- windowExtent 
- windowExtent: 
"
Class {
	#name : #WBAArenaDescriptor,
	#superclass : #Object,
	#instVars : [
		'cellDescriptors',
		'windowExtent'
	],
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #'2 players' }
WBAArenaDescriptor class >> alternative2PlayersArena [
	^ self new 
		windowExtent: 460@580;
		cellDescriptors: #(
			#[0 0 0 0 0 0 1 3 1 0 0 0 0 0 0]
			#[1 0 1 1 0 0 0 0 0 0 0 1 1 0 1]
			#[0 0 0 0 0 1 1 1 1 1 0 1 0 0 0]
			#[0 1 1 0 1 0 0 0 1 0 0 0 0 1 0]
			#[0 1 0 0 0 0 1 0 0 0 1 0 1 1 0]
			#[0 0 0 1 0 1 1 1 1 1 0 0 0 0 0]
			#[1 0 1 1 0 0 0 0 0 0 0 1 1 0 1]
			#[0 0 0 0 0 0 1 2 1 0 0 0 0 0 0] );
		yourself
]

{ #category : #'3 players' }
WBAArenaDescriptor class >> alternative3PlayersArena [
	^ self new 
		windowExtent: 720@580;
		cellDescriptors: #(
			#[1 0 1 0 0 0 1 3 1 0 0 0 1 0 1]
			#[0 0 0 0 1 0 0 0 0 0 1 0 0 0 0]
			#[1 0 1 1 1 1 1 0 1 1 1 1 1 0 1]
			#[0 0 0 0 0 0 1 0 1 0 0 0 0 0 0]
			#[0 1 1 0 1 0 0 0 0 0 1 0 1 1 0]
			#[0 0 1 0 1 0 1 1 1 0 1 0 1 0 0]
			#[1 0 0 0 1 0 0 4 0 0 1 0 0 0 1]
			#[0 0 1 0 1 0 1 1 1 0 1 0 1 0 0]
			#[0 1 1 0 1 0 0 0 0 0 1 0 1 1 0]
			#[0 0 0 0 0 0 1 0 1 0 0 0 0 0 0]
			#[1 0 1 1 1 1 1 0 1 1 1 1 1 0 1]
			#[0 0 0 0 1 0 0 0 0 0 1 0 0 0 0]
			#[1 0 1 0 0 0 1 2 1 0 0 0 1 0 1] );
		yourself
]

{ #category : #'2 players' }
WBAArenaDescriptor class >> available2Players [
	^ #(
	default2PlayersArena
	alternative2PlayersArena)
]

{ #category : #'3 players' }
WBAArenaDescriptor class >> available3Players [
	^ #(
	default3PlayersArena
	alternative3PlayersArena)
]

{ #category : #'4 players' }
WBAArenaDescriptor class >> available4Players [
	^ #(
	center4PlayersArena
	default4PlayersArena
	maze4PlayersArena
	chaotic4PlayersArena 
	)
]

{ #category : #'4 players' }
WBAArenaDescriptor class >> center4PlayersArena [
	^ self new 
		windowExtent: 800@580;
		cellDescriptors: #(
			#[5 0 0 0 0 0 0 1 1 0 0 0 0 0 0 2]
			#[1 1 1 1 1 1 0 1 1 0 1 1 1 1 1 1]
			#[0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0]
			#[0 1 0 1 1 0 0 0 0 0 0 1 1 0 1 0]
			#[0 1 0 1 0 0 0 0 0 0 0 0 1 0 1 0]
			#[0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0]
			#[0 1 0 1 0 0 0 0 0 0 0 0 1 0 1 0]
			#[0 0 0 1 0 0 1 1 1 1 0 0 1 0 0 0]
			#[0 1 0 1 0 0 0 0 0 0 0 0 1 0 1 0]
			#[0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0]
			#[0 1 0 1 0 0 0 0 0 0 0 0 1 0 1 0]
			#[0 1 0 1 1 0 0 0 0 0 0 1 1 0 1 0]
			#[0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0]
			#[1 1 1 1 1 1 0 1 1 0 1 1 1 1 1 1]
			#[4 0 0 0 0 0 0 1 1 0 0 0 0 0 0 3] );
		yourself
]

{ #category : #'4 players' }
WBAArenaDescriptor class >> chaotic4PlayersArena [
	^ self new 
		windowExtent: 800@580;
		cellDescriptors: #(
			#[5 0 0 0 0 0 0 1 0 0 0 0 0 0 0 2]
			#[0 1 1 1 0 1 0 1 0 1 1 0 1 1 1 0]
			#[0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0]
			#[1 0 1 1 0 0 1 1 0 1 0 0 1 1 0 1]
			#[0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0]
			#[0 1 0 0 0 0 1 1 0 1 0 1 0 0 1 0]
			#[0 0 1 1 0 1 0 0 0 1 0 0 0 1 0 0]
			#[1 0 0 1 0 1 0 1 0 0 0 1 1 0 0 1]
			#[1 1 0 0 0 0 1 0 0 1 0 0 0 0 0 1]
			#[1 0 1 0 1 0 1 0 1 1 0 1 1 0 1 1]
			#[0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0]
			#[0 1 1 0 0 0 1 0 1 1 0 1 0 1 0 1]
			#[0 0 0 1 0 1 1 0 1 1 0 0 0 1 0 1]
			#[1 0 0 0 0 1 0 0 0 1 0 1 1 0 0 0]
			#[4 0 1 0 0 0 0 1 0 0 0 0 0 0 1 3] );
		yourself
]

{ #category : #'2 players' }
WBAArenaDescriptor class >> default2PlayersArena [
	^ self new 
		windowExtent: 720@580;
		cellDescriptors: #(
			#[0 0 0 0 0 0 1 3 1 0 0 0 0 0 0]
			#[0 1 1 0 1 0 0 0 0 0 1 0 1 1 0]
			#[0 0 0 0 1 0 1 1 1 0 1 0 0 0 0]
			#[1 1 1 0 0 0 0 0 0 0 0 0 1 1 1]
			#[0 0 0 0 1 0 1 0 1 0 1 0 0 0 0]
			#[0 1 0 1 0 1 0 0 0 1 0 1 0 1 0]
			#[0 1 0 0 0 1 0 1 0 1 0 0 0 1 0]
			#[0 1 0 1 0 1 0 0 0 1 0 1 0 1 0]
			#[0 0 0 0 1 0 1 0 1 0 1 0 0 0 0]
			#[1 1 1 0 0 0 0 0 0 0 0 0 1 1 1]
			#[0 0 0 0 1 0 1 1 1 0 1 0 0 0 0]
			#[0 1 1 0 1 0 0 0 0 0 1 0 1 1 0]
			#[0 0 0 0 0 0 1 2 1 0 0 0 0 0 0] );
		yourself
]

{ #category : #'3 players' }
WBAArenaDescriptor class >> default3PlayersArena [
	^ self new 
		windowExtent: 720@580;
		cellDescriptors: #(
			#[1 0 0 0 0 0 1 3 1 0 0 0 0 0 0]
			#[0 0 1 0 1 0 0 0 0 0 1 0 1 1 0]
			#[1 0 0 0 1 0 1 1 1 0 1 0 0 0 0]
			#[0 0 1 0 0 0 0 0 0 0 0 0 0 1 1]
			#[0 1 0 0 1 0 1 0 1 0 0 1 0 0 0]
			#[0 1 0 1 0 0 0 0 0 1 0 0 0 1 0]
			#[0 0 0 1 0 1 0 1 0 0 0 1 0 0 4]
			#[0 1 0 1 0 0 0 0 0 1 0 0 0 1 0]
			#[0 1 0 0 1 0 1 0 1 0 0 1 0 0 0]
			#[0 0 1 0 0 0 0 0 0 0 0 0 0 1 1]
			#[1 0 0 0 1 0 1 1 1 0 1 0 0 0 0]
			#[0 0 1 0 1 0 0 0 0 0 1 0 1 1 0]
			#[1 0 0 0 0 0 1 2 1 0 0 0 0 0 0] );
		yourself
]

{ #category : #'4 players' }
WBAArenaDescriptor class >> default4PlayersArena [
	^ self new 
		windowExtent: 800@580;
		cellDescriptors: #(
			#[5 0 0 1 0 0 0 1 1 0 0 0 1 0 0 2]
			#[1 1 0 0 0 1 0 1 1 0 1 0 0 0 1 1]
			#[0 0 0 1 0 1 0 0 0 0 1 0 1 0 0 0]
			#[0 1 1 0 0 0 0 1 1 0 0 0 0 1 1 0]
			#[0 0 0 0 1 1 0 0 0 0 1 1 0 0 0 0]
			#[1 1 0 1 1 1 0 1 1 0 1 1 1 0 1 1]
			#[0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0]
			#[0 1 1 0 0 1 0 1 1 0 1 0 0 1 1 0]
			#[0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0]
			#[1 1 0 1 1 1 0 1 1 0 1 1 1 0 1 1]
			#[0 0 0 0 1 1 0 0 0 0 1 1 0 0 0 0]
			#[0 1 1 0 0 0 0 1 1 0 0 0 0 1 1 0]
			#[0 0 0 1 0 1 0 0 0 0 1 0 1 0 0 0]
			#[1 1 0 0 0 1 0 1 1 0 1 0 0 0 1 1]
			#[4 0 0 1 0 0 0 1 1 0 0 0 1 0 0 3] );
		yourself
]

{ #category : #'4 players' }
WBAArenaDescriptor class >> large4PlayersArena [
	^ self new 
		windowExtent: 1420@980;
		cellDescriptors: #(
			#[5 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 2]
			#[1 1 1 0 1 0 1 0 1 1 0 1 0 1 1 1 1 0 1 0 1 0 1 1 0 1 1 1]
			#[0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0]
			#[0 1 1 0 0 1 1 0 1 0 0 1 1 0 1 1 1 0 0 1 1 0 1 0 0 1 1 0]
			#[0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0]
			#[1 0 0 0 0 1 1 0 1 0 1 0 0 0 1 0 0 0 0 1 1 0 1 0 1 0 0 1]
			#[0 1 1 0 1 0 0 0 1 0 0 0 1 0 0 1 1 0 1 0 0 0 1 0 0 0 0 0]
			#[0 0 1 0 1 0 1 0 0 0 1 1 0 0 0 0 1 0 1 0 1 0 1 0 1 1 0 1]
			#[1 0 0 0 0 1 0 0 1 0 1 0 0 1 1 0 0 0 0 1 0 0 1 0 0 0 0 0]
			#[0 1 0 1 0 1 0 1 0 0 0 0 1 1 0 1 0 1 0 1 0 1 0 0 1 1 0 1]
			#[0 0 0 1 0 0 0 0 0 1 1 0 0 0 0 0 0 1 0 0 0 0 0 1 1 0 0 0]
			#[1 1 0 0 0 1 0 1 0 0 1 0 1 0 1 1 0 0 0 1 0 1 0 0 1 0 1 0]
			#[0 0 1 0 1 1 0 1 1 0 0 0 1 0 0 0 1 0 1 1 0 1 1 0 0 0 1 0]
			#[0 0 0 0 1 0 0 0 1 0 1 0 0 1 0 1 0 0 1 0 0 0 1 0 1 0 0 0]
			#[1 1 1 0 1 0 1 0 1 0 1 1 1 0 0 0 1 0 1 0 1 0 1 0 0 1 1 1]
			#[0 0 0 0 1 0 0 0 1 0 0 0 0 0 1 0 0 0 1 0 0 0 0 1 0 0 0 0]
			#[0 1 1 0 0 1 1 0 1 0 1 1 1 0 1 1 1 0 0 1 1 0 1 0 0 1 1 0]
			#[0 0 1 1 0 0 0 0 0 0 0 1 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0]
			#[1 0 0 0 0 1 1 0 1 0 1 0 0 1 1 0 0 0 0 1 1 0 1 0 0 1 0 1]
			#[0 1 1 0 1 0 0 0 1 0 0 0 1 0 0 0 0 1 0 0 1 0 0 0 1 0 0 0]
			#[0 0 1 0 1 0 1 0 0 0 1 1 0 0 1 0 1 0 1 0 0 0 1 0 1 1 1 0]
			#[1 0 0 0 0 1 0 0 1 0 0 0 0 0 0 1 0 0 0 1 0 1 1 0 0 0 0 0]
			#[0 1 0 1 0 1 0 1 1 0 1 1 0 1 1 0 0 1 0 1 0 1 0 0 1 1 0 1]
			#[0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 1 1 0 0 0 0 0 1 1 0 0 0]
			#[1 1 0 0 0 1 0 1 1 0 1 0 1 0 1 0 1 0 0 1 0 1 0 0 1 0 1 0]
			#[1 0 1 0 1 0 0 0 1 0 0 0 1 0 1 0 0 0 1 1 0 1 1 0 0 0 1 0]
			#[0 0 0 0 1 0 1 0 1 0 1 1 0 0 0 1 1 0 0 0 0 0 1 0 1 1 0 0]
			#[4 1 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 1 0 1 0 0 0 0 0 0 3] );
		yourself
]

{ #category : #'4 players' }
WBAArenaDescriptor class >> maze4PlayersArena [
	^ self new 
		windowExtent: 800@580;
		cellDescriptors: #(
			#[5 0 0 0 0 0 0 1 0 0 0 0 0 0 0 2]
			#[1 1 1 1 0 1 0 0 1 0 1 0 1 1 1 1]
			#[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
			#[0 1 1 0 1 0 1 1 1 1 0 1 0 1 1 0]
			#[0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0]
			#[0 1 0 1 0 1 0 1 1 0 1 0 1 0 1 0]
			#[0 1 0 1 0 0 0 0 0 0 0 0 1 0 1 0]
			#[0 1 0 0 0 1 1 0 1 1 1 0 0 0 1 0]
			#[0 1 0 1 0 0 0 0 0 0 0 0 1 0 1 0]
			#[0 1 0 1 0 1 1 1 0 1 1 0 1 0 1 0]
			#[0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0]
			#[0 1 1 0 1 0 1 1 1 1 0 1 0 1 1 0]
			#[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
			#[1 1 1 1 0 1 0 1 0 0 1 0 1 1 1 1]
			#[4 0 0 0 0 0 0 0 1 0 0 0 0 0 0 3] );
		yourself
]

{ #category : #accessing }
WBAArenaDescriptor >> cellDescriptors [
	^ cellDescriptors
]

{ #category : #accessing }
WBAArenaDescriptor >> cellDescriptors: cells [
	cellDescriptors := cells
]

{ #category : #Bootstrap }
WBAArenaDescriptor >> dispatchIndex: index on: bootstraper with: cell [
	index = 0 ifTrue: [ ^ bootstraper bootstrapGroundOnlyCell: cell ].
	index = 1 ifTrue: [ ^ bootstraper bootstrapWallCell: cell ].
	^ bootstraper bootstrapCharacterCell: cell playerIndex: index - 1 
]

{ #category : #accessing }
WBAArenaDescriptor >> expectedNumberOfPlayers [
	| max |
	max := 0.
	cellDescriptors do: [ :column |
		column do: [ :descr | 
			max := max max: descr ] ].
	^ max - 1
]

{ #category : #accessing }
WBAArenaDescriptor >> windowExtent [
	^ windowExtent
]

{ #category : #accessing }
WBAArenaDescriptor >> windowExtent: anObject [
	windowExtent := anObject
]
