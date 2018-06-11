as yet unclassified
loadSprites: gameDescr surface: surface
	grounds := gameDescr backgroundDescriptor loadGroundSpritesWith: surface.
	walls := (gameDescr backgroundDescriptor loadWallSpritesWith: surface) collect: [ :each |
		WBAWall new
			sprite: each;
			yourself ].
	spells := gameDescr spellDescriptors collect: [ :each | 
		self loadDescriptor: each surface: surface into: WBASpell ].
	characters := gameDescr characterDescriptors collect: [ :each | 
		self loadDescriptor: each surface: surface into: WBACharacter ].