"
Class representing a region occuped by a texture
"
Class {
	#name : #WinterTextureRegion,
	#superclass : #Object,
	#instVars : [
		'texture',
		'regionWidth',
		'regionHeight',
		'u',
		'u2',
		'v',
		'v2'
	],
	#category : 'Winter-Tiled'
}

{ #category : #'Instance Creation' }
WinterTextureRegion class >> fromAnotherTextureRegion: aTextureRegion [

	^ (self of: aTextureRegion texture)
		setRegionUsingU: aTextureRegion u
		v: aTextureRegion v
		u2: aTextureRegion u2
		v2: aTextureRegion v2
]

{ #category : #'Instance Creation' }
WinterTextureRegion class >> of: aTexture [ 

	^ self of: aTexture x: 0 y: 0 width: aTexture width height: aTexture height 
]

{ #category : #'Instance Creation' }
WinterTextureRegion class >> of: aTexture x: aNumber y: anotherNumber width: aWidth height: aHeight [

	^ self new
		initializeOf: aTexture
		x: aNumber
		y: anotherNumber
		width: aWidth
		height: aHeight
]

{ #category : #Flipping }
WinterTextureRegion >> flipX: aBoolean [

	aBoolean
		ifTrue: [ | temporal |
			temporal := u.
			u := u2.
			u2 := temporal ]
		ifFalse: [ "Do nothing" ]
]

{ #category : #Flipping }
WinterTextureRegion >> flipY: aBoolean [

	aBoolean
		ifTrue: [ | temporal |
			temporal := v.
			v := v2.
			v2 := temporal ]
		ifFalse: [ "Do nothing" ]
]

{ #category : #initialization }
WinterTextureRegion >> initializeOf: aTexture x: aNumber y: anotherNumber width: aWidth height: aHeight [

|invertedTextureHeight invertedTextureWidth|

invertedTextureHeight := 1.0 / aTexture height .
invertedTextureWidth := 1.0 / aTexture width .

	texture := aTexture.
	self setRegionUsingU: (aNumber* invertedTextureWidth ) v: (anotherNumber* invertedTextureHeight ) u2: ((aNumber+ aWidth ) * invertedTextureWidth ) v2: ((anotherNumber+ aHeight  ) * invertedTextureHeight  ).
	regionWidth := aWidth abs.
	regionHeight := aHeight abs
]

{ #category : #Testing }
WinterTextureRegion >> isFlippedX [

	^ u > u2
]

{ #category : #Testing }
WinterTextureRegion >> isFlippedY [

	^ v > v2
]

{ #category : #Accessing }
WinterTextureRegion >> regionHeight [

	^ regionHeight
]

{ #category : #Accessing }
WinterTextureRegion >> regionHeight: anInteger [

	self isFlippedY
		ifTrue: [ self v: (v2 + anInteger) / texture height  asFloat ]
		ifFalse: [ self v2: (v + anInteger) / texture height  asFloat ]
]

{ #category : #Accessing }
WinterTextureRegion >> regionWidth [

	^ regionWidth 
]

{ #category : #Accessing }
WinterTextureRegion >> regionWidth: anInteger [

	self isFlippedX
		ifTrue: [ self u: (u2 + anInteger) / texture width asFloat ]
		ifFalse: [ self u2: (u + anInteger) / texture width asFloat ]
]

{ #category : #Accessing }
WinterTextureRegion >> regionX [

	^ u * texture width roundTo: 0.1
]

{ #category : #Accessing }
WinterTextureRegion >> regionX: anInteger [

	self u: (anInteger/ texture width asFloat )

]

{ #category : #Accessing }
WinterTextureRegion >> regionY [

	^ v * texture height  roundTo: 0.1
]

{ #category : #Accessing }
WinterTextureRegion >> regionY: anInteger [

	self v: (anInteger/ texture height  asFloat )

]

{ #category : #initialization }
WinterTextureRegion >> setRegionUsingU: aPartialUValue v: aPartialVValue u2: aPartialU2Value v2: aPartialV2Value [

	| partialU partialU2 partialV partialV2 |

	partialU := aPartialUValue.
	partialU2 := aPartialU2Value.
	partialV := aPartialVValue .
	partialV2 := aPartialV2Value.

	regionWidth := (aPartialU2Value - aPartialUValue) abs * texture width roundTo: 0.1.
	regionHeight := (aPartialV2Value - aPartialVValue) abs * texture height roundTo: 0.1.

	"For a 1x1 region, adjust UVs toward pixel center to avoid filtering artifacts on AMD GPUs when drawing very stretched"
	(regionHeight = 1 and: [ regionWidth = 1 ])
		ifTrue: [ 
			| adjustedX adjustedY |
			
			adjustedX := 0.25 / texture width.
			partialU := partialU + adjustedX.
			partialU2 := partialU2 - adjustedX.
			
			adjustedY := 0.25 / texture height.
			partialV := partialV + adjustedY.
			partialV2 := partialV2 - adjustedY ].
		
	u := partialU.
	u2 := partialU2.
	v := partialV.
	v2 := partialV2
]

{ #category : #Accessing }
WinterTextureRegion >> texture [

	^ texture
]

{ #category : #Accessing }
WinterTextureRegion >> texture: aTexture [

	texture := aTexture 
]

{ #category : #Accessing }
WinterTextureRegion >> u [

	^ u
]

{ #category : #Accessing }
WinterTextureRegion >> u2 [

	^ u2
]

{ #category : #Accessing }
WinterTextureRegion >> u2: aFloat [

	u2 := aFloat.
	regionWidth := (u2 - u) abs * texture width roundTo: 0.1
]

{ #category : #Accessing }
WinterTextureRegion >> u: aFloat [

	u := aFloat.
	regionWidth := (u2 - u) abs * texture width roundTo: 0.1
]

{ #category : #Accessing }
WinterTextureRegion >> v [

	^ v
]

{ #category : #Accessing }
WinterTextureRegion >> v2 [

	^ v2
]

{ #category : #Accessing }
WinterTextureRegion >> v2: aFloat [

	v2 := aFloat.
	regionHeight  := (v2 - v) abs * texture height  roundTo: 0.1
]

{ #category : #Accessing }
WinterTextureRegion >> v: aFloat [

	v := aFloat.
	regionHeight  := (v2 - v) abs * texture height  roundTo: 0.1
]
