"
I am a class to represent the game environment where elements interact.

Instance Variables
- active 
- components 
- players


Public API and Key Messages:

- activate
- addComponent:
- addComponents:
- addPlayer:
- components
- isActive
- removeComponent:
- removePlayer:

"
Class {
	#name : #WinterScene,
	#superclass : #WinterReactiveObject,
	#instVars : [
		'active',
		'components',
		'players'
	],
	#category : #'Winter-Core-Base'
}

{ #category : #initialization }
WinterScene >> activate [

	active := true
]

{ #category : #Managing }
WinterScene >> addComponent: aComponent [

	aComponent scene: self.
	components := components copyWith: aComponent
]

{ #category : #Managing }
WinterScene >> addComponents: aCollection [

	aCollection do: [ :each | self addComponent: each ]
]

{ #category : #Managing }
WinterScene >> addPlayer: aPlayer [

	aPlayer scene: self.
	players := players copyWith: aPlayer
]

{ #category : #accessing }
WinterScene >> components [

	^ components
]

{ #category : #initialization }
WinterScene >> initialize [

	super initialize.
	players := OrderedCollection new.
	components := #().
	active := false
]

{ #category : #testing }
WinterScene >> isActive [

	^ active
]

{ #category : #Managing }
WinterScene >> removeComponent: aComponent [

	components := components copyWithout: aComponent.
	aComponent scene: nil
]

{ #category : #Managing }
WinterScene >> removePlayer: aPlayer [

	aPlayer scene: nil.
	players := players copyWithout: aPlayer
]
