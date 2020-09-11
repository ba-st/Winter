Class {
	#name : #CircleTest,
	#superclass : #TestCase,
	#instVars : [
		'paintSetted',
		'shapeDrawed'
	],
	#category : #'Winter-PhysicsTests'
}

{ #category : #'Suppor Render' }
CircleTest >> createPath: aBlockClosure [ 
	
]

{ #category : #'Suppor Render' }
CircleTest >> drawShape: aCircleTest [ 
	
	shapeDrawed := true.
]

{ #category : #'Suppor Render' }
CircleTest >> pathTransform [
	
]

{ #category : #'Suppor Render' }
CircleTest >> restoreAfter: aBlockClosure [

	aBlockClosure value
]

{ #category : #'Suppor Render' }
CircleTest >> setPaint: aColor [

	paintSetted := true
]

{ #category : #running }
CircleTest >> setUp [

	super setUp.
	paintSetted := false.
	shapeDrawed := false
]

{ #category : #Tests }
CircleTest >> testAccessing [

	| circle |

	circle := Circle ofCenter: 250 @ 530 radius: 15 color: Color red.

	self
		assert: circle bounds equals: ( 250 @ 530 extent: 15 @ 15 );
		assert: circle radius equals: 15;
		assert: circle position equals: 250 @ 530;
		assert: circle color equals: Color red
]

{ #category : #Tests }
CircleTest >> testDoNotIntersectsASquare [

	| circle square |

	circle := Circle ofCenter: 250 @ 530 radius: 15 color: Color red.

	square := Square ofCenter: 200 @ 560 extent: 20 @ 5 color: Color red.

	self deny: ( circle intersects: square )
]

{ #category : #Tests }
CircleTest >> testDoNotIntersectsAnotherCircle [

	| circle anotherCircle |

	circle := Circle ofCenter: 250 @ 530 radius: 15 color: Color red.

	anotherCircle := Circle ofCenter: 100 @ 200 radius: 15 color: Color red.

	self deny: ( circle intersects: anotherCircle )
]

{ #category : #Tests }
CircleTest >> testIntersectsASquare [

	| circle square |

	circle := Circle ofCenter: 250 @ 530 radius: 15 color: Color red.

	square := Square ofCenter: 250 @ 530 extent: 200 @ 50 color: Color red.

	self assert: ( circle intersects: square )
]

{ #category : #Tests }
CircleTest >> testIntersectsAnotherCircle [

	| circle anotherCircle |

	circle := Circle ofCenter: 250 @ 530 radius: 15 color: Color red.

	anotherCircle := Circle ofCenter: 240 @ 520 radius: 15 color: Color red.

	self assert: ( circle intersects: anotherCircle )
]

{ #category : #Tests }
CircleTest >> testPrinting [

	| circle |

	circle := Circle ofCenter: 250 @ 530 radius: 15 color: Color red.

	self
		assert: circle printString
		equals:
			( 'Circle - position [<1s>] - radius: <2s> - color: <3p> '
				expandMacrosWith: circle position printString
				with: circle radius printString
				with: circle color printString )
]

{ #category : #Tests }
CircleTest >> testRender [

	| circle |

	"This is not very useful, it tests the message send"
	circle := Circle ofCenter: 250 @ 530 radius: 15 color: Color red.

	self
		deny: paintSetted;
		deny: shapeDrawed.

	circle renderOn: self.

	self
		assert: paintSetted;
		assert: shapeDrawed
]

{ #category : #'Suppor Render' }
CircleTest >> translateBy: aPoint [ 
	
]
