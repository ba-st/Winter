Tests
testDoNotIntersectsASquare

	| game circle square |

	game := self game.
	circle := Winter2DCircle
		ofCenter: 250 @ 530
		radius: 15
		color: Color red
		in: game.
	square := Winter2DSquare
		ofCenter: 200 @ 560
		extent: 20 @ 5
		color: Color red
		in: game.
		
	self deny: (circle intersects: square)