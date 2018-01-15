tests
testAccessing

	| game |

	game := WinterTestGame new.
	game buildWindow .

	self
		assert: (game currentScene isKindOf: WinterTestScene);
		assert: game scenes notEmpty;
		assert: game players isEmpty;
		assert: game dimensions equals: 650@700;
		assert: game stepTime equals: 30;
		assert: game title equals: 'Test';
		assert: (game window isKindOf: WinterGameWindow) ;
		assert: (game surfaceContainer isKindOf: ImageMorph) 