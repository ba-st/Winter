Class {
	#name : #WBAGameDescriptor,
	#superclass : #Object,
	#instVars : [
		'arenaDescriptor',
		'characterDescriptors',
		'spellDescriptors',
		'groundDescriptor',
		'wallDescriptor'
	],
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #'as yet unclassified' }
WBAGameDescriptor class >> demo2 [
	^ self demo: #default2PlayersArena
]

{ #category : #'as yet unclassified' }
WBAGameDescriptor class >> demo3 [
	^ self demo: #default3PlayersArena
]

{ #category : #'as yet unclassified' }
WBAGameDescriptor class >> demo4 [
	^ self demo: #default4PlayersArena
]

{ #category : #'as yet unclassified' }
WBAGameDescriptor class >> demo: selector [
	| arenaDescr numPlayers |
	arenaDescr := WBAArenaDescriptor perform: selector.
	numPlayers := arenaDescr expectedNumberOfPlayers.
	^ self new
		arenaDescriptor: arenaDescr;
		characterDescriptors: ((1 to: numPlayers) collect: [ :i | WBACharacterDescriptor randomCharacter]);
		spellDescriptors: ((1 to: numPlayers) collect: [ :i | WBASpellDescriptor randomSpell]);
		groundDescriptor: WBAGroundDescriptor randomBackground;
		wallDescriptor: WBAWallDescriptor randomBackground ;
		yourself
]

{ #category : #accessing }
WBAGameDescriptor >> arenaDescriptor [

	^ arenaDescriptor
]

{ #category : #accessing }
WBAGameDescriptor >> arenaDescriptor: anArenaDescriptor [

	arenaDescriptor := anArenaDescriptor 
]

{ #category : #accessing }
WBAGameDescriptor >> characterDescriptors [

	^ characterDescriptors
]

{ #category : #accessing }
WBAGameDescriptor >> characterDescriptors: aCharacterDescriptorsCollection [

	characterDescriptors := aCharacterDescriptorsCollection 
]

{ #category : #accessing }
WBAGameDescriptor >> ensureCorrectness [
	"Answers if the descriptor is in a correct state to start the game"
	self assert: arenaDescriptor expectedNumberOfPlayers = characterDescriptors size.
	self assert: spellDescriptors size = characterDescriptors size.
	
]

{ #category : #accessing }
WBAGameDescriptor >> groundDescriptor [

	^ groundDescriptor
]

{ #category : #accessing }
WBAGameDescriptor >> groundDescriptor: aGroundDescriptor [

	groundDescriptor := aGroundDescriptor
]

{ #category : #accessing }
WBAGameDescriptor >> spellDescriptors [

	^ spellDescriptors
]

{ #category : #accessing }
WBAGameDescriptor >> spellDescriptors: aSpellDescriptorsCollection [

	spellDescriptors := aSpellDescriptorsCollection
]

{ #category : #accessing }
WBAGameDescriptor >> wallDescriptor [

	^ wallDescriptor
]

{ #category : #accessing }
WBAGameDescriptor >> wallDescriptor: aWallDescriptor [

	wallDescriptor := aWallDescriptor
]
