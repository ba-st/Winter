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
	#name : #WinterMenuScreenModel,
	#superclass : #WinterWidget,
	#instVars : [
		'screen',
		'startingGame'
	],
	#category : #'Winter-View-ViewModel'
}

{ #category : #Accessing }
WinterMenuScreenModel >> background [

	^ Color black
]

{ #category : #Accessing }
WinterMenuScreenModel >> dimensions [

	^ 760 @ 480
]

{ #category : #rendering }
WinterMenuScreenModel >> display [

	self loadWidgets.
	self startAnimation.
	screen model: self.
	screen show
]

{ #category : #actions }
WinterMenuScreenModel >> downSelection [
]

{ #category : #animations }
WinterMenuScreenModel >> endAnimation [

	startingGame scheduler stopGameTickActionFor: self
]

{ #category : #'screen building' }
WinterMenuScreenModel >> endScreenComputation [
]

{ #category : #'event handling' }
WinterMenuScreenModel >> enterCode [

	^ 40
]

{ #category : #'event handling' }
WinterMenuScreenModel >> eventHandler [

	| handler |

	handler := BasicEventHandler of: startingGame.
	handler registerObserver: self.

	^ handler
]

{ #category : #animations }
WinterMenuScreenModel >> every10GameTickDo: aBlock [

	startingGame scheduler
		newGameTickAction: ( ConfigurableAnimation doing: aBlock every: 10 )
		for: self
]

{ #category : #Accessing }
WinterMenuScreenModel >> extent [

	^ 760 @ 480
]

{ #category : #'event handling' }
WinterMenuScreenModel >> handleGenericKeyStroke: code [
	"key codes for arrows"
	code = 81 ifTrue: [ self downSelection ].
	code = 80 ifTrue: [ self leftSelection ].
	code = 79 ifTrue: [ self rightSelection ].
	code = 82 ifTrue: [ self upSelection ].
]

{ #category : #'event handling' }
WinterMenuScreenModel >> handleKeyStrokeFor: playerIndex key: index [ 

	"overide if you use player specific shortcuts"

]

{ #category : #'event handling' }
WinterMenuScreenModel >> handleKeyUp: code [

	code = self enterCode ifTrue: [ self nextScreen ].
	self hasPlayerSpecificHandling
		ifTrue: [ self handlePlayersKeyStroke: code ]
		ifFalse: [ self handleGenericKeyStroke: code ]
]

{ #category : #'event handling' }
WinterMenuScreenModel >> handlePlayersKeyStroke: code [	
	
	startingGame players withIndexDo: [ :player :playerIndex |
		| index |
		((index := player keyboardCodes indexOf: code) between: 1 and: 4)
			ifTrue: [ self handleKeyStrokeFor: playerIndex key: index ] ]
]

{ #category : #testing }
WinterMenuScreenModel >> hasPlayerSpecificHandling [

	^ false
]

{ #category : #actions }
WinterMenuScreenModel >> leftSelection [
]

{ #category : #initialization }
WinterMenuScreenModel >> loadCadreSprites: numPlayers [

	^ ( WBACadreDescriptor for: numPlayers )
		loadSpritesWith: screen surface
		using: startingGame assetsManager
]

{ #category : #private }
WinterMenuScreenModel >> loadWidgets [

	self subclassResponsibility
]

{ #category : #'screen building' }
WinterMenuScreenModel >> newAnimatedWidget: sprites [

	^ WinterToggleSingleSpriteWidget new
		sprites: sprites;
		yourself
]

{ #category : #'screen building' }
WinterMenuScreenModel >> newCadreWidgets: numPlayers [

	| cadreSprites |
	cadreSprites := self loadCadreSprites: numPlayers.
	^ (1 to: numPlayers) collect: [ :i | 
		self newSingleSpriteWidget: (cadreSprites at: i) ].
]

{ #category : #'screen building' }
WinterMenuScreenModel >> newColumnWidget: widgets space: space [

	^ WinterColumnWidget new
		widgets: widgets;
		space: space;
		yourself
]

{ #category : #'screen building' }
WinterMenuScreenModel >> newLargeArrowSelectWidget: space [

	^ self 
		newRowWidget: { (self textWidgetAt: #arrowLeft0) . (self textWidgetAt: #arrowRight0) } 
		space: space
]

{ #category : #'screen building' }
WinterMenuScreenModel >> newRowWidget: widgets space: space [

	^ WinterRowWidget new
		widgets: widgets;
		space: space;
		yourself
]

{ #category : #'screen building' }
WinterMenuScreenModel >> newSelectWidget: sprite [

	^ self 
		newRowWidget: { (self textWidgetAt: #select) . sprite }
		space: 160
]

{ #category : #'screen building' }
WinterMenuScreenModel >> newSingleSpriteWidget: sprite [

	^ WinterSingleSpriteWidget new 
		sprite: sprite;
		yourself
]

{ #category : #actions }
WinterMenuScreenModel >> nextScreen [

	self endAnimation.
	self endScreenComputation.
	self switchToNextScreen.
]

{ #category : #'screen building' }
WinterMenuScreenModel >> nextScreen: screenClass [

	screenClass new
		screen: screen;
		startingGame: startingGame;
		display
]

{ #category : #'screen building' }
WinterMenuScreenModel >> printOn: aStream [

	aStream
		nextPutAll:
			('<1s> - game: <2s>'
				expandMacrosWith: self class name
				with: startingGame printString)
]

{ #category : #rendering }
WinterMenuScreenModel >> renderOn: aCanvas [

	screen renderBackground: aCanvas color: self background.
	self renderWidgetsOn: aCanvas
]

{ #category : #private }
WinterMenuScreenModel >> renderWidgetsOn: aCanvas [

	self subclassResponsibility
]

{ #category : #actions }
WinterMenuScreenModel >> rightSelection [
]

{ #category : #Accessing }
WinterMenuScreenModel >> screen [

	^ screen 
]

{ #category : #Accessing }
WinterMenuScreenModel >> screen: anObject [

	screen := anObject 
]

{ #category : #animations }
WinterMenuScreenModel >> startAnimation [
]

{ #category : #Accessing }
WinterMenuScreenModel >> startingGame [

	^ startingGame
]

{ #category : #Accessing }
WinterMenuScreenModel >> startingGame: anObject [

	startingGame := anObject
]

{ #category : #'event handling' }
WinterMenuScreenModel >> stop [

	startingGame stop
]

{ #category : #'screen building' }
WinterMenuScreenModel >> switchToNextScreen [

	self subclassResponsibility 
]

{ #category : #private }
WinterMenuScreenModel >> textSpriteAt: name [

	^ screen surface createFormPaint: (startingGame textSpritesAt: name asString)
]

{ #category : #private }
WinterMenuScreenModel >> textWidgetAt: name [

	^ self newSingleSpriteWidget: (self textSpriteAt: name)
]

{ #category : #actions }
WinterMenuScreenModel >> upSelection [
]

{ #category : #Updating }
WinterMenuScreenModel >> updateUsing: anAthensCairoCanvas [
]
