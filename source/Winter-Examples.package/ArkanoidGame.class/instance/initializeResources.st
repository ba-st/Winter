initialization
initializeResources
	| assetsSystem |
	assetsSystem := WinterAssetManagementSystem current.
	(assetsSystem addSprite: 'background.png' named: #background)
		scaledToSize: self dimensions.
	(assetsSystem addSprite: 'yellow.png' named: #yellow) scaledToSize: 38 @ 38.
	(assetsSystem addSprite: 'green.png' named: #green) scaledToSize: 38 @ 38.
	(assetsSystem addSprite: 'red.png' named: #red) scaledToSize: 38 @ 38.
	(assetsSystem
		addSprite: 'arkanoid_bar.png' named: #arkanoidBar;
		addSound: 'arkanoid_ball_collision.wav' named: #ballCollision;
		addSprite: 'ball.png' named: #ball) scaledToSize: 38 @ 38