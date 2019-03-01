Class {
	#name : #WBASpellSelectScreenModel,
	#superclass : #WinterMenuScreenModel,
	#instVars : [
		'currentChoices',
		'titleWidget',
		'arrowWidgets',
		'spellWidgets'
	],
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #actions }
WBASpellSelectScreenModel >> endScreenComputation [
	startingGame gameDescriptor spellDescriptors: ((1 to: startingGame players size) collect: [ :i | 
		WBASpellDescriptor new
			fileName: 'spell' , ((currentChoices at: i) + 1) printString;
			yourself]).
]

{ #category : #actions }
WBASpellSelectScreenModel >> handleKeyStrokeFor: playerIndex key: index [
	| currentLocation newLocation |
	currentLocation := currentChoices at: playerIndex.
	newLocation := (currentLocation + (index * 2 - 5)) \\ 6.
	newLocation < 0 ifTrue: [ newLocation := 5 ].
	currentChoices at: playerIndex put: newLocation.
]

{ #category : #testing }
WBASpellSelectScreenModel >> hasPlayerSpecificHandling [
	^ true
]

{ #category : #'Screen Building' }
WBASpellSelectScreenModel >> loadSpellSprites [
	^ (1 to: 6) collect: [ :i |
		WBASpellExplodeDescriptor new
			fileName: 'spell' , i printString;
			loadSpritesWith: screen surface using: startingGame  assetsManagementSystem ]
]

{ #category : #initialization }
WBASpellSelectScreenModel >> loadWidgets [
	| numPlayers |
	titleWidget := self newSelectWidget: (self textWidgetAt: #spell).
	numPlayers := startingGame players size.
	spellWidgets := self newSpellWidgets: numPlayers.
	arrowWidgets := self newCadreWidgets: numPlayers.
	currentChoices :=  #(0 1 2 3) copyFrom: 1 to: numPlayers.
]

{ #category : #'Screen Building' }
WBASpellSelectScreenModel >> newSpellWidgets: numPlayers [
	| spellSprites widgets |
	spellSprites := self loadSpellSprites.
	widgets := spellSprites collect: [ :sp | self newAnimatedWidget: sp ].
	^ (1 to: numPlayers) collect: [ :i |
		self newRowWidget: widgets space: 80 ]
]

{ #category : #rendering }
WBASpellSelectScreenModel >> renderWidgetsOn: canvas [
	| activeChoices |
	activeChoices := currentChoices. "can change while rendering"
	titleWidget renderOn: canvas translatedBy: 210@30.
	canvas pathTransform translateX: -74 Y: 0.
	1 to: spellWidgets size do: [ :i |
		(spellWidgets at: i) renderOn: canvas translatedBy: 0@90.
		(arrowWidgets at: i) renderOn: canvas temporarilyTranslatedBy: (activeChoices at: i) * 80 - 5 @ -10. ]
]

{ #category : #animations }
WBASpellSelectScreenModel >> startAnimation [
	self every10GameTickDo: [
		spellWidgets first widgets do: [ :toggleSp | 
				toggleSp toggle ] ] 
]

{ #category : #actions }
WBASpellSelectScreenModel >> switchToNextScreen [
	self nextScreen: WBAArenaSelectScreenModel 
]
