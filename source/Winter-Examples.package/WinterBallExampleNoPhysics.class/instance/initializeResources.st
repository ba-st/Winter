Initialization
initializeResources
	WinterAssetManagementSystem current
		addSound: (WinterSound fromRelativePath: 'paraelisa.wav') named: 'paraelisa';
		addSound: (WinterSound fromRelativePath: 'bullet.wav') named: 'bullet';
		addSprite: (WinterSprite fromRelativePath: 'kirby.png') named: 'kirby'