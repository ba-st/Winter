Class {
	#name : #GameSceneTest,
	#superclass : #TestCase,
	#instVars : [
		'painted',
		'drawed'
	],
	#category : #'Winter-CoreTests-Base'
}

{ #category : #drawing }
GameSceneTest >> drawShape: aRectangle [

	drawed := true
]

{ #category : #drawing }
GameSceneTest >> extent [

	^ 1 @ 1
]

{ #category : #drawing }
GameSceneTest >> setPaint: aColor [

	painted := true
]

{ #category : #drawing }
GameSceneTest >> setUp [

	painted := false.
	drawed := false
]

{ #category : #drawing }
GameSceneTest >> testAccessing [

	| scene |

	scene := GameScene new.

	self assert: scene background equals: Color white.
	scene background: Color orange.

	self assert: scene background equals: Color orange
]

{ #category : #drawing }
GameSceneTest >> testPrinting [

	| scene |

	scene := GameScene new.

	self assert: scene printString equals: 'GameScene'
]

{ #category : #drawing }
GameSceneTest >> testRenderOn [

	| scene |

	"This tests that expected messages are sended to the canvas(#setPaint: #extent #drawShape) "
	scene := GameScene new.
	self
		deny: painted;
		deny: drawed.

	scene renderOn: self.

	self
		assert: painted;
		assert: drawed
]
