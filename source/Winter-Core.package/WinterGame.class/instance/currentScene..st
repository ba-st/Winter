accessing
currentScene: aScene
	currentScene := aScene.
	self pushEvent: (WinterSceneActivated scene: aScene).
	self pushEvent: (WinterSceneUpdated scene: aScene)