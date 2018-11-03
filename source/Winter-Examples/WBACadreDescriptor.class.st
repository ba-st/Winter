Class {
	#name : #WBACadreDescriptor,
	#superclass : #WBASpriteDescriptor,
	#category : 'Winter-Examples-WizardBattle'
}

{ #category : #Bootstrap }
WBACadreDescriptor >> classFolder [
	^ 'perso/'
]

{ #category : #Bootstrap }
WBACadreDescriptor >> loadSpritesWith: surface numSprites: num [
	| sprites |
	sprites := Array new: num.
	1 to: num do: [ :i |
		fileName := 'cadre' , i printString.
		sprites at: i put: self loadImageFile ].
	^ sprites
]
