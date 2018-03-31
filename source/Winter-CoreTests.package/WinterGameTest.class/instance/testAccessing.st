tests
testAccessing


	game := WinterTestGame new.


	self
		assert: (game scene isKindOf: WinterTestScene);
		assert: game dimensions equals: 650@700;
		assert: game stepTime equals: 30;
		assert: game title equals: 'Test'