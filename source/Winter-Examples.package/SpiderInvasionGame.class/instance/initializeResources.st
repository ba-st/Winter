initialization
initializeResources

	WinterAssetManagementSystem current
		addSprite: (WinterSprite fromPath: 'spider.png') named: #spider;
		addSprite: (WinterSprite fromPath: 'wall.png') named: #wall;
		addSprite: (WinterSprite fromPath: 'missile.png') named: #missile;
		addSprite: (WinterSprite fromPath: 'explode.png') named: #explode;
		addSprite: (WinterSprite fromPath: 'spaceShip.png') named: #spaceShip