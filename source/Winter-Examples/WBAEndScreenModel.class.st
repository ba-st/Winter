"
Class representenging the end of game view model

Public API and Key Messages

- upSelection
- downSelection
- loadWidgets
- winner:
- switchToNextScreen
- renderWidgetsOn:
 
Internal Representation and Key Implementation Points.

    Instance Variables
		currentChoice 
		winner 
		characterWidget 
		titleWidget 
		choiceWidgets 
		arrowWidget 
		spellWidget
	
"
Class {
	#name : #WBAEndScreenModel,
	#superclass : #WinterMenuScreenModel,
	#instVars : [
		'currentChoice',
		'winner',
		'characterWidget',
		'titleWidget',
		'choiceWidgets',
		'arrowWidget',
		'spellWidget'
	],
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #actions }
WBAEndScreenModel >> downSelection [
	currentChoice := currentChoice + 1 \\ 2
]

{ #category : #initialization }
WBAEndScreenModel >> initialize [

	super initialize.

	currentChoice := 0.
]

{ #category : #initialization }
WBAEndScreenModel >> loadWidgets [

	titleWidget := self textWidgetAt: #winner.
	
	spellWidget := self newAnimatedWidget: (winner character spell sprites last: 4).
		
	characterWidget := self newAnimatedWidget: { 
		winner character sprites first .
		winner character sprites third }.
		
	arrowWidget := self newLargeArrowSelectWidget: 450.
	
	choiceWidgets := self 
		newColumnWidget: { 
			self newSelectWidget: (self textWidgetAt: #arena) .
			self newSelectWidget: (self textWidgetAt: #players) } 
		space: 80
	
]

{ #category : #rendering }
WBAEndScreenModel >> renderWidgetsOn: canvas [
	titleWidget renderOn: canvas translatedBy: 260@30.
	spellWidget renderOn: canvas translatedBy: -12@90.
	characterWidget renderOn: canvas translatedBy: 90@0.
	spellWidget renderOn: canvas translatedBy: 90@0.
	choiceWidgets renderOn: canvas translatedBy: -220@90.
	arrowWidget renderOn: canvas translatedBy: -90 @ (10 + (80 * currentChoice)).
]

{ #category : #animations }
WBAEndScreenModel >> startAnimation [
	self every10GameTickDo: [ 
		characterWidget toggle.
		spellWidget toggle ] 
]

{ #category : #actions }
WBAEndScreenModel >> switchToNextScreen [
	currentChoice = 0 
		ifTrue: [ self nextScreen: WBAArenaSelectScreenModel ]
		ifFalse: [ 
			startingGame scheduler terminateProcess.
			WBANumberPlayerSelectScreenModel new
				screen: screen;
				display ]
]

{ #category : #actions }
WBAEndScreenModel >> upSelection [
	currentChoice := currentChoice + 1 \\ 2
]

{ #category : #initialization }
WBAEndScreenModel >> winner: player [
	winner := player
]
