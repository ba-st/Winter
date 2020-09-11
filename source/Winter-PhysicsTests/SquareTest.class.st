Class {
	#name : #SquareTest,
	#superclass : #TestCase,
	#category : #'Winter-PhysicsTests'
}

{ #category : #Tests }
SquareTest >> testAccessing [

	| square |

	square := Square ofCenter: 200 @ 560 extent: 200 @ 0 color: Color red.

	self
		assert: square extent equals: 200 @ 0;
		assert: square position equals: 200 @ 560;
		assert: square bounds equals: ( square position extent: square extent );
		assert: square color equals: Color red
]

{ #category : #Tests }
SquareTest >> testDoNotIntersectsACircle [

	| circle square |

	circle := Circle ofCenter: 250 @ 530 radius: 15 color: Color red.
	square := Square ofCenter: 200 @ 560 extent: 20 @ 5 color: Color red.

	self deny: ( square intersects: circle )
]

{ #category : #Tests }
SquareTest >> testDoNotIntersectsAnotherSquare [

	| square anotherSquare |

	square := Square ofCenter: 200 @ 560 extent: 20 @ 5 color: Color red.
	anotherSquare := Square ofCenter: 150 @ 500 extent: 20 @ 5 color: Color red.

	self deny: ( square intersects: anotherSquare )
]

{ #category : #Tests }
SquareTest >> testIntersectsACircle [

	| circle square |

	circle := Circle ofCenter: 250 @ 530 radius: 15 color: Color red.
	square := Square ofCenter: 250 @ 530 extent: 200 @ 50 color: Color red.

	self assert: ( square intersects: circle )
]

{ #category : #Tests }
SquareTest >> testIntersectsAnotherSquare [

	| square anotherSquare |

	square := Square ofCenter: 200 @ 560 extent: 20 @ 5 color: Color red.
	anotherSquare := Square ofCenter: 200 @ 560 extent: 20 @ 5 color: Color red.

	self assert: ( square intersects: anotherSquare )
]

{ #category : #Tests }
SquareTest >> testPrinting [

	| square |

	square := Square ofCenter: 200 @ 560 extent: 200 @ 0 color: Color red.

	self
		assert: square printString
		equals:
			( 'Square - position [<1s>] - extent: <2s> - color: <3p> '
				expandMacrosWith: square position printString
				with: square extent printString
				with: square color printString )
]
