Class {
	#name : #GameAnimationTest,
	#superclass : #TestCase,
	#category : #'Winter-CoreTests-Animations'
}

{ #category : #tests }
GameAnimationTest >> testAccessing [

	| animation |

	animation := FakeAnimation new.

	self
		assert: animation numberOfAnimationFrame equals: 10;
		assert: animation actualStep isZero.

	animation actualStep: 5.

	self assert: animation actualStep equals: 5
]

{ #category : #tests }
GameAnimationTest >> testAnimatedColorsOutIn [

	| animation |

	animation := FakeAnimation new.

	self
		assert: animation actualStep isZero;
		assert: animation timesAnimated isZero.

	animation animate.

	self
		assert: animation actualStep equals: 1;
		assert: animation timesAnimated equals: 1.

	animation animate.

	self
		assert: animation actualStep equals: 2;
		assert: animation timesAnimated equals: 2
]

{ #category : #tests }
GameAnimationTest >> testTesting [

	| animation |

	animation := FakeAnimation new.

	self
		deny: animation isMidAnimation;
		deny: animation isEndAnimation;
		assert: ( animation isAnimationSplit: 5 ).
		
	animation actualStep: 3.

	self
		deny: animation isMidAnimation;
		deny: animation isEndAnimation;
		deny: ( animation isAnimationSplit: 5 ).
		
	animation actualStep: 5.

	self
		assert: animation isMidAnimation;
		deny: animation isEndAnimation;
		deny: ( animation isAnimationSplit: 5 ).

	animation actualStep: 10.

	self
		deny: animation isMidAnimation;
		assert: animation isEndAnimation;
		assert: ( animation isAnimationSplit: 5 )
]
