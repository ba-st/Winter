Collision
spiderEnter: spider

	| leftOrRight newPosition |

	leftOrRight := #(-1 1) atRandom.
	newPosition := spider position + (leftOrRight @ 0).
	((game scene isValidePosition: newPosition) and: [ (game scene itemAt: newPosition) isEmpty ])
		ifTrue: [ 
			game scene itemAt: newPosition put: spider.
			spider position: newPosition  ]