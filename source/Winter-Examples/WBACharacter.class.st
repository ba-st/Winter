Class {
	#name : #WBACharacter,
	#superclass : #WBAElement,
	#instVars : [
		'scheduler',
		'sprites',
		'player',
		'spell',
		'cell',
		'direction',
		'isMoving',
		'currentFoot',
		'game'
	],
	#category : 'Winter-Examples-WizardBattle'
}

{ #category : #animations }
WBACharacter >> bury [
	cell element: WBAEmpty empty.
	scheduler stopGameTickActionFor: self.
	cell := nil.
	game checkEndGame
]

{ #category : #animations }
WBACharacter >> castSpell [
	spell castFrom: self
]

{ #category : #accessing }
WBACharacter >> cell [
	^ cell
]

{ #category : #accessing }
WBACharacter >> cell: anObject [
	cell := anObject
]

{ #category : #accessing }
WBACharacter >> currentFoot [
	^ currentFoot
]

{ #category : #accessing }
WBACharacter >> currentFoot: anObject [
	currentFoot := anObject
]

{ #category : #animations }
WBACharacter >> die [
	isMoving := true.
	scheduler stopGameTickActionFor: self.
	scheduler 
		newGameTickAction: (WBADieAnimation new
			character: self;
			yourself)
		for: self
]

{ #category : #animations }
WBACharacter >> dieRotation [
	direction := direction \\ 4 + 1
]

{ #category : #accessing }
WBACharacter >> direction [
	^ direction
]

{ #category : #accessing }
WBACharacter >> direction: anObject [
	direction := anObject
]

{ #category : #animations }
WBACharacter >> finishMoveAnimation [ 
	scheduler stopGameTickActionFor: self.
	isMoving := false.
	player movementKeyDown
		ifNil: [ currentFoot := 0 ]
		ifNotNil: [ :dir | self maybeMove: dir ]
]

{ #category : #accessing }
WBACharacter >> game [
	^ game
]

{ #category : #accessing }
WBACharacter >> game: anObject [
	game := anObject
]

{ #category : #accessing }
WBACharacter >> initialShift [
	^ 8@ -32
]

{ #category : #initialization }
WBACharacter >> initialize [

	super initialize.

	self shift: self initialShift.
	direction := 1.
	isMoving := false.
	currentFoot := 0.
]

{ #category : #testing }
WBACharacter >> isDead [
	^ cell isNil
]

{ #category : #accessing }
WBACharacter >> isMoving [
	^ isMoving
]

{ #category : #accessing }
WBACharacter >> isMoving: anObject [
	isMoving := anObject
]

{ #category : #animations }
WBACharacter >> maybeMove: index [
	isMoving ifTrue: [ "already moves" ^ self ].
	direction := index. 
	(cell neighbours at: index) element allowMovement ifFalse: [ ^ currentFoot := 0 ].
	self move: index
]

{ #category : #animations }
WBACharacter >> move: index [
	isMoving := true.
	currentFoot := 1.
	scheduler 
		newGameTickAction: (WBACharacterMoveAnimation new
			character: self;
			direction: index;
			yourself)
		for: self 
]

{ #category : #accessing }
WBACharacter >> player [
	^ player
]

{ #category : #accessing }
WBACharacter >> player: anObject [
	player := anObject
]

{ #category : #rendering }
WBACharacter >> renderOn: canvas [
	canvas pathTransform translateBy: shift.
	canvas setPaint: self spriteToRender.
	canvas draw.
	canvas pathTransform translateBy: negatedShift. 
]

{ #category : #accessing }
WBACharacter >> scheduler [
	^ scheduler
]

{ #category : #accessing }
WBACharacter >> scheduler: anObject [
	scheduler := anObject
]

{ #category : #accessing }
WBACharacter >> spell [
	^ spell
]

{ #category : #accessing }
WBACharacter >> spell: anObject [
	spell := anObject
]

{ #category : #accessing }
WBACharacter >> spriteToRender [
	^ sprites at: direction * 3 - 1 + currentFoot 
	
]

{ #category : #accessing }
WBACharacter >> sprites [
	^ sprites
]

{ #category : #accessing }
WBACharacter >> sprites: anObject [
	sprites := anObject
]

{ #category : #animations }
WBACharacter >> switchCell: shiftIncr [
	| newCell |
	newCell := cell neighbours at: direction.
	newCell element allowMovement ifTrue: [ 
		cell element: WBAEmpty empty.
		cell := newCell.
		cell element: self.
		cell spells 
			detect: [ :sp | sp character ~= self ] 
			ifFound: [ :elem | elem nextAnimation ].
		self shift: self initialShift - (self numberOfAnimationFrame / 2 * shiftIncr negated).
		^ shiftIncr ].
	"newCell is full, move back"
	^ shiftIncr negated
]

{ #category : #animations }
WBACharacter >> switchFoot [
	currentFoot := currentFoot negated
]
