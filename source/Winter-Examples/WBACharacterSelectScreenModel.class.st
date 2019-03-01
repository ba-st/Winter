Class {
	#name : #WBACharacterSelectScreenModel,
	#superclass : #WinterMenuScreenModel,
	#instVars : [
		'currentChoices',
		'titleWidget',
		'arrowWidgets',
		'characterWidget'
	],
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #'Screen Building' }
WBACharacterSelectScreenModel >> characterRowWidgets [
	^ #(0 192) flatCollect: [ :y |
		#(0 96 192 288) collect: [ :x |
			self newCharacterRowWidget: x @ y ] ]
]

{ #category : #'Screen Building' }
WBACharacterSelectScreenModel >> characterWidgets: cood [
	^ (1 to: 13) collect: [ :i |
			| sprites |
			sprites := WBACharacterDescriptor new
				fileName: 'perso' , i printString;
				position: cood;
				loadShortSpritesWith: screen surface using: startingGame  assetsManagementSystem .
			self newAnimatedWidget: sprites ]
]

{ #category : #actions }
WBACharacterSelectScreenModel >> endScreenComputation [
	startingGame gameDescriptor characterDescriptors: ((1 to: startingGame players size) collect: [ :i | 
		WBACharacterDescriptor new
			fileName: 'perso' , ((currentChoices at: i) x + 1) printString;
			position: (#(0 96 192 288) at: (currentChoices at: i) y \\ 4 + 1) @ (#(0 192) at: (currentChoices at: i) y // 4 + 1) ;
			yourself]).
]

{ #category : #accessing }
WBACharacterSelectScreenModel >> extent [
	^ 760 @ 550
]

{ #category : #actions }
WBACharacterSelectScreenModel >> handleKeyStrokeFor: playerIndex key: index [
	| currentLocation newLocation |
	currentLocation := currentChoices at: playerIndex.
	newLocation := currentLocation + ((index \\ 3 - 1) @ (index // 2 - 1)) negated.
	newLocation := (newLocation max: 0@0) min: 12@7.
	(currentChoices anySatisfy: [ :each | each = newLocation ]) ifTrue: [ ^ self ].
	currentChoices at: playerIndex put: newLocation.
]

{ #category : #testing }
WBACharacterSelectScreenModel >> hasPlayerSpecificHandling [
	^ true
]

{ #category : #initialization }
WBACharacterSelectScreenModel >> loadWidgets [
	| numPlayers |
	titleWidget := self newSelectWidget: (self textWidgetAt: #character).
	characterWidget := self newCharacterWidget.
	numPlayers := startingGame players size.
	arrowWidgets := self newCadreWidgets: numPlayers.
	currentChoices := { 0@0 . 2@2 . 4@4 . 6@6 } copyFrom: 1 to: numPlayers.
	
]

{ #category : #'Screen Building' }
WBACharacterSelectScreenModel >> newCharacterRowWidget: i [ 
	^ self newRowWidget: (self characterWidgets: i) space: 52
]

{ #category : #'Screen Building' }
WBACharacterSelectScreenModel >> newCharacterWidget [
	^ self newColumnWidget: self characterRowWidgets space: 50
]

{ #category : #rendering }
WBACharacterSelectScreenModel >> renderWidgetsOn: canvas [
	| activeChoices |
	activeChoices := currentChoices. "can change while rendering"
	titleWidget renderOn: canvas translatedBy: 210@30.
	characterWidget renderOn: canvas translatedBy: -160@70.
	canvas pathTransform translateX: -5 Y: -2.
	arrowWidgets withIndexDo: [ :w :i |
		w renderOn: canvas temporarilyTranslatedBy: (activeChoices at: i) * (52@50) ] 
]

{ #category : #rendering }
WBACharacterSelectScreenModel >> startAnimation [
	self every10GameTickDo: [
		characterWidget widgets do: [ :w |
			w widgets do: [ :toggleSp |
				toggleSp toggle ] ] ] 
]

{ #category : #actions }
WBACharacterSelectScreenModel >> switchToNextScreen [	
	
	self nextScreen: WBASpellSelectScreenModel 
]
