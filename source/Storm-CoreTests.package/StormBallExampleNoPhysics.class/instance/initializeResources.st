Initialization
initializeResources
	StormAssetManagementSystem current
		addSound: (StormSound fromRelativePath: 'paraelisa.wav') named: 'paraelisa';
		addSound: (StormSound fromRelativePath: 'bullet.wav') named: 'bullet';
		addSprite: (StormSprite fromRelativePath: 'kirby.png') named: 'kirby'