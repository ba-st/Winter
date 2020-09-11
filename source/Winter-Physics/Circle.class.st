"
I am a Circle shape appearing in a 2D scene, with both a visual representation and a physical simulation..
Chipmunk2D (Native library) [ Disconnected ]

Instance Variables
- radius


Public API and Key Messages:

- bounds
- radius 
- radius:
"
Class {
	#name : #Circle,
	#superclass : #GameShape,
	#instVars : [
		'radius'
	],
	#category : #'Winter-Physics-Shapes'
}

{ #category : #'Instance Creation' }
Circle class >> ofCenter: aPoint radius: aFloat color: aColor [

	^ self new initializeOfCenter: aPoint radius: aFloat color: aColor
]

{ #category : #Accessing }
Circle >> bounds [

	^ position extent: radius @ radius
]

{ #category : #private }
Circle >> createPaintOn: aCanvas [

	^ graphicsPaint := self color
]

{ #category : #private }
Circle >> createPathOn: aCanvas [

	^ graphicsPath := aCanvas
		createPath: [ :builder | 
			| r rNeg halfPi |

			r := self radius.
			rNeg := r negated.
			halfPi := Float halfPi.
			builder
				relative;
				moveTo: 0 @ r;
				cwArcTo: r @ rNeg angle: halfPi;
				cwArcTo: r @ r angle: halfPi;
				cwArcTo: rNeg @ r angle: halfPi;
				cwArcTo: rNeg @ rNeg angle: halfPi
			]
]

{ #category : #private }
Circle >> drawShape: aShape on: aCanvas [

	aCanvas drawShape: aShape
]

{ #category : #Initialization }
Circle >> initializeOfCenter: aPoint radius: aFloat color: aColor [

	position := aPoint.
	radius := aFloat.
	color := aColor
]

{ #category : #printing }
Circle >> printOn: aStream [

	aStream
		nextPutAll:
			( 'Circle - position [<1s>] - radius: <2s> - color: <3p> '
				expandMacrosWith: self position printString
				with: self radius printString
				with: self color printString )
]

{ #category : #Accessing }
Circle >> radius [

	^ radius ifNil: [ radius := self class defaultRadius ]
]

{ #category : #Accessing }
Circle >> radius: aNumber [

	radius := aNumber.
	graphicsPath := nil
]

{ #category : #private }
Circle >> setSpecificPaint: aPaint on: aCanvas [

	aCanvas setPaint: aPaint
]
