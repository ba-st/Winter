Tests
testIntersectsACircle

	| game circle square |

	game := WinterTestGame new.
	circle := Winter2DCircle
		ofCenter: 250 @ 530
		radius: 15
		color: Color red
		in: game.
	square := Winter2DSquare
		ofCenter: 250 @ 530
		extent: 200 @ 50
		color: Color red
		in: game.
		
	self assert: (square intersects: circle )