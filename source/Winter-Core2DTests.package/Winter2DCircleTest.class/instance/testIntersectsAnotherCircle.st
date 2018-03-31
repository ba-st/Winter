Tests
testIntersectsAnotherCircle

	| game circle anotherCircle |

	game := self game.
	circle := Winter2DCircle
		ofCenter: 250 @ 530
		radius: 15
		color: Color red
		in: game.
	anotherCircle := Winter2DCircle
		ofCenter: 240 @ 520
		radius: 15
		color: Color red
		in: game.
		
	self assert: (circle intersects: anotherCircle)