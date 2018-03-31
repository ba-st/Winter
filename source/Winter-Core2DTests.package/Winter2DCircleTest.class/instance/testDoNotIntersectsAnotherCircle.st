Tests
testDoNotIntersectsAnotherCircle

	| game circle anotherCircle |

	game := self game.
	circle := Winter2DCircle
		ofCenter: 250 @ 530
		radius: 15
		color: Color red
		in: game.
	anotherCircle := Winter2DCircle
		ofCenter: 100 @ 200
		radius: 15
		color: Color red
		in: game.
		
	self deny: (circle intersects: anotherCircle)