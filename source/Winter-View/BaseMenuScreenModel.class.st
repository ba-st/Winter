"
Abstract class for Screen view models

Public API and Key Messages

- background  
- downSelection
- endAnimation
- endScreenComputation
- eventHandler
- eventHandlerFor:
- every10GameTickDo:
- extent
- handleKeyStroke:
- handlePlayerKeyStroke:
- leftSelection
- loadWidgets
- nextScreen
- nextScreen:
- renderOn:
- rightSelection
- screen
- screen:
- startAnimation
- switchToNextScreen
- terminateProcesses
- upSelection
- updateUsing:
 
Internal Representation and Key Implementation Points.

    Instance Variables
		screen 
		startingGame
	
"
Class {
	#name : #BaseMenuScreenModel,
	#superclass : #BaseWidget,
	#instVars : [
		'screen',
		'game'
	],
	#category : #'Winter-View-ViewModel'
}

{ #category : #accessing }
BaseMenuScreenModel >> background [

	^ Color black
]

{ #category : #accessing }
BaseMenuScreenModel >> dimensions [

	^ 760 @ 480
]

{ #category : #rendering }
BaseMenuScreenModel >> display [

	screen model: self.
	screen show.
	self loadWidgets.
	self startAnimation
]

{ #category : #actions }
BaseMenuScreenModel >> downSelection [
]

{ #category : #animations }
BaseMenuScreenModel >> endAnimation [

	self subclassResponsibility
]

{ #category : #'event handling' }
BaseMenuScreenModel >> eventHandler [

	self subclassResponsibility
]

{ #category : #accessing }
BaseMenuScreenModel >> extent [

	^ 760 @ 480
]

{ #category : #accessing }
BaseMenuScreenModel >> game [

	^ game
]

{ #category : #accessing }
BaseMenuScreenModel >> game: anObject [

	game := anObject
]

{ #category : #'event handling' }
BaseMenuScreenModel >> handleKeyDown: aKeyEvent [

	self subclassResponsibility
]

{ #category : #'event handling' }
BaseMenuScreenModel >> handleKeyUp: anEvent [

	self subclassResponsibility
]

{ #category : #actions }
BaseMenuScreenModel >> leftSelection [
]

{ #category : #private }
BaseMenuScreenModel >> loadWidgets [

	self subclassResponsibility
]

{ #category : #'screen building' }
BaseMenuScreenModel >> newAnimatedWidget: sprites [

	^ WinterToggleSingleSpriteWidget new
		sprites: sprites;
		yourself
]

{ #category : #'screen building' }
BaseMenuScreenModel >> newColumnWidget: widgets space: space [

	^ WinterColumnWidget new
		widgets: widgets;
		space: space;
		yourself
]

{ #category : #'screen building' }
BaseMenuScreenModel >> newRowWidget: widgets space: space [

	^ WinterRowWidget new
		widgets: widgets;
		space: space;
		yourself
]

{ #category : #'screen building' }
BaseMenuScreenModel >> newSingleSpriteWidget: sprite [

	^ WinterSingleSpriteWidget new 
		sprite: sprite;
		yourself
]

{ #category : #printing }
BaseMenuScreenModel >> printOn: aStream [

	aStream
		nextPutAll:
			('<1s> - game: <2s>'
				expandMacrosWith: self class name
				with: game printString)
]

{ #category : #rendering }
BaseMenuScreenModel >> renderOn: aCanvas [

	screen renderBackground: self background on: aCanvas.
	self renderWidgetsOn: aCanvas
]

{ #category : #private }
BaseMenuScreenModel >> renderWidgetsOn: aCanvas [

	self subclassResponsibility
]

{ #category : #actions }
BaseMenuScreenModel >> rightSelection [
]

{ #category : #accessing }
BaseMenuScreenModel >> screen [

	^ screen 
]

{ #category : #accessing }
BaseMenuScreenModel >> screen: anObject [

	screen := anObject 
]

{ #category : #animations }
BaseMenuScreenModel >> startAnimation [

	self subclassResponsibility
]

{ #category : #'event handling' }
BaseMenuScreenModel >> stop [

	game stop
]

{ #category : #actions }
BaseMenuScreenModel >> upSelection [
]
