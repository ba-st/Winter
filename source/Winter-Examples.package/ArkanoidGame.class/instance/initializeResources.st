initialization
initializeResources

	WinterAssetManagementSystem current
		addSprite:
			((WinterSprite fromPath: 'background.png')
				scaledToSize: self dimensions;
				yourself)
			named: #background;
		addSprite:
			((WinterSprite fromPath: 'yellow.png')
				scaledToSize: 38 @ 38;
				yourself)
			named: #yellow;
		addSprite:
			((WinterSprite fromPath: 'green.png')
				scaledToSize: 38 @ 38;
				yourself)
			named: #green;
		addSprite:
			((WinterSprite fromPath: 'red.png')
				scaledToSize: 38 @ 38;
				yourself)
			named: #red;
		addSprite: (WinterSprite fromPath: 'arkanoid_bar.png') named: #arkanoidBar;
		addSound: (WinterSound fromPath: 'arkanoid_ball_collision.wav')
			named: #ballCollision;
		addSprite:
			((WinterSprite fromPath: 'ball.png')
				scaledToSize: 38 @ 38;
				yourself)
			named: #ball