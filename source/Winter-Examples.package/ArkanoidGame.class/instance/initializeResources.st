Initialization
initializeResources

	WinterAssetManagementSystem current
		addSprite:
			((WinterSprite fromRelativePath: 'background.png')
				scaledToSize: self dimensions;
				yourself)
			named: #background;
		addSprite: (WinterSprite fromRelativePath: 'yellow.jpeg') named: #yellow;
		addSprite: (WinterSprite fromRelativePath: 'green.png') named: #green;
		addSprite: (WinterSprite fromRelativePath: 'arkanoid_bar.png') named: #arkanoidBar;
		addSound: (WinterSound fromRelativePath: 'arkanoid_ball_collision.wav') named: #ballCollision;
		addSprite: ((WinterSprite fromRelativePath: 'ball.png') scaledToSize: 38@38;
				yourself) named: #ball 