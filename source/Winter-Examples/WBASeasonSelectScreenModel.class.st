Class {
	#name : #WBASeasonSelectScreenModel,
	#superclass : #WinterMenuScreenModel,
	#instVars : [
		'currentChoice',
		'titleWidget',
		'seasonWidgets',
		'arrowWidget'
	],
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #actions }
WBASeasonSelectScreenModel >> endScreenComputation [

	| gameDescriptor |

	gameDescriptor := WBAGameDescriptor
		perform: ('demo' , startingGame players size printString) asSymbol.
	startingGame gameDescriptor: gameDescriptor.
	gameDescriptor
		groundDescriptor: (WBAGroundDescriptor backgroundAt: currentChoice);
		wallDescriptor: (WBAWallDescriptor backgroundAt: currentChoice)
]

{ #category : #initialization }
WBASeasonSelectScreenModel >> initialize [

	super initialize.

	currentChoice := 1.
]

{ #category : #actions }
WBASeasonSelectScreenModel >> leftSelection [
	currentChoice := currentChoice - 1.
	currentChoice = 0 ifTrue: [ currentChoice := 6 ].
]

{ #category : #initialization }
WBASeasonSelectScreenModel >> loadWidgets [
	titleWidget := self newSelectWidget: (self textWidgetAt: #season).
	seasonWidgets := (1 to: 6) collect: [ :i | 
		self newSeasonWidget: i ].
	arrowWidget := self newSmallArrowSelectWidget: 80.
]

{ #category : #'Screen Building' }
WBASeasonSelectScreenModel >> newLeftArrowColumSelectWidget [
	| w |
	w := self textWidgetAt: #arrowLeft1.
	^ self newColumnWidget: { w . w . w } space: 80.
]

{ #category : #'Screen Building' }
WBASeasonSelectScreenModel >> newRightArrowColumSelectWidget [
	| w |
	w := self textWidgetAt: #arrowRight1.
	^ self newColumnWidget: { w . w . w } space: 80.
]

{ #category : #'Screen Building' }
WBASeasonSelectScreenModel >> newSeasonSubWidget: sprites [
	^ self 
		newColumnWidget: (sprites collect: [ :each | self newSingleSpriteWidget: each ])
		space: -32
]

{ #category : #'Screen Building' }
WBASeasonSelectScreenModel >> newSeasonWidget: num [
	^ self 
		newColumnWidget: (self seasonSubWidgets: num)
		space: 32
]

{ #category : #'Screen Building' }
WBASeasonSelectScreenModel >> newSmallArrowSelectWidget: space [
	^  self 
		newRowWidget: { self newLeftArrowColumSelectWidget . self newRightArrowColumSelectWidget }
		space: space
]

{ #category : #rendering }
WBASeasonSelectScreenModel >> renderWidgetsOn: canvas [
	titleWidget renderOn: canvas translatedBy: 210@30.
	canvas pathTransform translateBy: -200@130.
	seasonWidgets do: [ :widget |
		widget renderOn: canvas translatedBy: 100@0. ].
	arrowWidget renderOn: canvas translatedBy: ((-6 + currentChoice) * 100 - 31) @ 10
]

{ #category : #actions }
WBASeasonSelectScreenModel >> rightSelection [
	currentChoice := currentChoice \\ 6 + 1.
]

{ #category : #'Screen Building' }
WBASeasonSelectScreenModel >> seasonSubWidgets: aNumber [

	| groundDescriptor wallDescriptor grounds walls basicGroundWidget |
	
	groundDescriptor := WBAGroundDescriptor backgroundAt: aNumber .
	wallDescriptor := WBAWallDescriptor  backgroundAt: aNumber .
	grounds := groundDescriptor loadSpritesWith: screen surface.
	walls := wallDescriptor loadSpritesWith: screen surface.
	basicGroundWidget := self newSeasonSubWidget: { grounds first }.
	^ { 
		self newSeasonSubWidget: { grounds first . walls first } .
		basicGroundWidget .
		self newSeasonSubWidget: { grounds first . walls second } .
		basicGroundWidget .
		self newSeasonSubWidget: { grounds first . walls third } .
		basicGroundWidget .
		self newSeasonSubWidget: { grounds second } .
	}
	
	
]

{ #category : #actions }
WBASeasonSelectScreenModel >> switchToNextScreen [
	
	self nextScreen: WBACharacterSelectScreenModel 
]
