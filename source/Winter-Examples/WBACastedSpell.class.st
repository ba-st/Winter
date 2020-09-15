"
I represent a casted spell from a character with a direction in the scene


Public API and Key Messages:

- cell:
- character:
- currentSPrite:
- direction:
- endExplodeAnimation
- explodeAnimation
- finishMoveAnimation
- move:
- renderOn:
- startAnimation
"
Class {
	#name : #WBACastedSpell,
	#superclass : #WBAArenaComponent,
	#instVars : [
		'sprites',
		'currentSprite',
		'cell',
		'direction',
		'scheduler',
		'character'
	],
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #accessing }
WBACastedSpell >> cell [
	^ cell
]

{ #category : #accessing }
WBACastedSpell >> cell: anObject [
	cell := anObject
]

{ #category : #accessing }
WBACastedSpell >> character [
	^ character
]

{ #category : #accessing }
WBACastedSpell >> character: anObject [
	character := anObject
]

{ #category : #accessing }
WBACastedSpell >> currentSprite [
	^ currentSprite
]

{ #category : #accessing }
WBACastedSpell >> currentSprite: anObject [
	^ currentSprite := anObject
]

{ #category : #accessing }
WBACastedSpell >> direction [
	^ direction
]

{ #category : #accessing }
WBACastedSpell >> direction: anObject [
	direction := anObject
]

{ #category : #animations }
WBACastedSpell >> endExplodeAnimation [
	scheduler stopGameTickActionFor: self.
	cell spells remove: self
]

{ #category : #animations }
WBACastedSpell >> explodeAnimation [
	| step |
	step := 0.
	cell element die.
	self nextSprite.
	scheduler 
		newGameTickAction: (WBAExplodeAnimation new
			spell: self;
			yourself)
		for: self
]

{ #category : #animations }
WBACastedSpell >> finishMoveAnimation [
	self nextAnimation
]

{ #category : #initialization }
WBACastedSpell >> initialShift [

	^ 8@ -16
]

{ #category : #initialization }
WBACastedSpell >> initialize [

	super initialize.

	self shift: self initialShift.
	currentSprite := 1.
]

{ #category : #animations }
WBACastedSpell >> move: startStep [
	scheduler 
		newGameTickAction: (WBASpellMoveAnimation new
			spell: self;
			direction: direction;
			actualStep: startStep;
			yourself)
		for: self 
]

{ #category : #initialization }
WBACastedSpell >> movingShift [

	^ shift - self initialShift
]

{ #category : #animations }
WBACastedSpell >> nextAnimation [
	scheduler stopGameTickActionFor: self.
	(cell element allowMovement or: [cell element = character]) ifTrue: [ 
		currentSprite < 3 ifTrue: [ self nextSprite ].
		^ self move: 0 ].
	self explodeAnimation.
]

{ #category : #animations }
WBACastedSpell >> nextSprite [
	currentSprite := currentSprite + 1
]

{ #category : #rendering }
WBACastedSpell >> renderOn: canvas [
	canvas pathTransform translateBy: shift.
	canvas setPaint: (sprites at: currentSprite).
	canvas draw.
	canvas pathTransform translateBy: negatedShift.
]

{ #category : #accessing }
WBACastedSpell >> scheduler [
	^ scheduler
]

{ #category : #accessing }
WBACastedSpell >> scheduler: anObject [
	scheduler := anObject
]

{ #category : #accessing }
WBACastedSpell >> sprites [
	^ sprites
]

{ #category : #accessing }
WBACastedSpell >> sprites: anObject [
	sprites := anObject
]

{ #category : #animations }
WBACastedSpell >> startAnimation [
	self move: (self numberOfAnimationFrame / 2 - 1)
]

{ #category : #animations }
WBACastedSpell >> switchCell: shiftIncr [
	cell spells remove: self.
	cell := cell neighbours at: direction.
	cell spells add: self.
	self shift: self initialShift - (self numberOfAnimationFrame / 2 * shiftIncr negated).
]
