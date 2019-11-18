"
I represent the arena renderable model


Public API and Key Messages:

- cells:
- screen:
- renderOn:
"
Class {
	#name : #WBAArena,
	#superclass : #WBAArenaComponent,
	#instVars : [
		'cells',
		'screen',
		'groundPaint'
	],
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #accessing }
WBAArena >> cells [
	^ cells
]

{ #category : #accessing }
WBAArena >> cells: anObject [
	cells := anObject
]

{ #category : #rendering }
WBAArena >> initGroundPaint: arenaSize [
	| surf |
	surf := AthensCairoSurface extent: arenaSize.
	surf drawDuring: [ :can |
		can setShape: (0@0 corner: self cellSize).
		self 	
			renderCells: [ :cell |
				can setPaint: cell ground.
				can draw ] 
			on: can ].
	groundPaint := AthensCairoPatternSurfacePaint createForSurface: surf
		
]

{ #category : #initialization }
WBAArena >> initialize [

	super initialize.
	self shift: -12 @ 8
]

{ #category : #rendering }
WBAArena >> renderBackgroundOn: canvas [
	canvas setPaint: Color gray.
	canvas drawShape: (0@0 fastCorner: screen window extent).
]

{ #category : #rendering }
WBAArena >> renderCells: aBlock on: canvas [ 
	| cellX cellY |
	cellX := self cellSize x.
	cellY := self cellSize y.
	cells do: [ :column |
		canvas pathTransform translateX: cellX Y: 0. 
		1 to: column size do: [ :i | "#to:do: here for performance, cf profiler"
			canvas pathTransform translateX: 0 Y: cellY. 
			aBlock value: (column at: i) ].
		canvas pathTransform translateX: 0 Y: cellY * column size negated  ].
	canvas pathTransform translateX: cellX * cells size negated Y: 0. 
]

{ #category : #rendering }
WBAArena >> renderElementsOn: canvas [
	self 
		renderCells: [ :cell | | elements |
			elements := (cell spells , { cell element }) sort: [ :a :b | a movingShift y < b movingShift y ].
			elements do: [ :sp | sp renderOn: canvas ] ]
		on: canvas 
]

{ #category : #rendering }
WBAArena >> renderGroundsOn: canvas [
	| arenaSize |
	arenaSize := cells size + 1 @ (cells first size + 1) * self cellSize.
	groundPaint ifNil: [ self initGroundPaint: arenaSize ].
	canvas setShape: (0@0 fastCorner: arenaSize).
	canvas setPaint: groundPaint.
	canvas draw.
]

{ #category : #rendering }
WBAArena >> renderOn: canvas [	
	self renderBackgroundOn: canvas.
	canvas pathTransform translateBy: shift.
	self renderGroundsOn: canvas.
	canvas setShape: (0@0 fastCorner: 48@64).
	self renderElementsOn: canvas.
]

{ #category : #accessing }
WBAArena >> screen [
	^ screen
]

{ #category : #accessing }
WBAArena >> screen: anObject [
	screen := anObject
]
