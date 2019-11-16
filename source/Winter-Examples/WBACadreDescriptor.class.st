"
I represent a descriptor of how the cadre will be like


Public API and Key Messages:

- classFolder
- loadSpritesWith:using:
- spriteSize

Internal Representation and Key Implementation Points.

    Instance Variables
		numberOfPlayers: <Number>
	
"
Class {
	#name : #WBACadreDescriptor,
	#superclass : #WinterSpriteDescriptor,
	#instVars : [
		'numberOfPlayers'
	],
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #'instance creation' }
WBACadreDescriptor class >> for: aNumberOfPlayers [

	^ self new initializeFor: aNumberOfPlayers
]

{ #category : #Bootstrap }
WBACadreDescriptor >> classFolder [
	^ 'perso/'
]

{ #category : #initialization }
WBACadreDescriptor >> initializeFor: aNumberOfPlayers [

	numberOfPlayers := aNumberOfPlayers
]

{ #category : #Bootstrap }
WBACadreDescriptor >> loadSpritesWith: surface using: anAssetsManagementSystem [
	| sprites |
	sprites := Array new: numberOfPlayers .
	1 to: numberOfPlayers do: [ :i |
		fileName := 'cadre' , i printString.
		sprites at: i put: (self loadImageFileUsing: anAssetsManagementSystem)  ].
	^ sprites
]

{ #category : #Bootstrap }
WBACadreDescriptor >> spriteSize [

	^ 32 @ 48
]
