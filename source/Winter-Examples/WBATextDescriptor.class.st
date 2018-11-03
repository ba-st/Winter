Class {
	#name : #WBATextDescriptor,
	#superclass : #WBASpriteDescriptor,
	#category : 'Winter-Examples-WizardBattle'
}

{ #category : #Defaults }
WBATextDescriptor class >> availableText [
	^ #( 
	1
	2
	3
	4
	arena
	arrowLeft0
	arrowLeft1
	arrowRight0
	arrowRight1
	character
	player
	players
	season
	select
	spell
	title
	winner
	)
]

{ #category : #Bootstrap }
WBATextDescriptor >> classFolder [
	^ 'text/'
]

{ #category : #Bootstrap }
WBATextDescriptor >> loadAllText [

	self class availableText do: [ :key |
		fileName := key asString.
		self loadImageFile ].

]
