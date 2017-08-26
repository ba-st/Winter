accessing
currentScene: aScene
	currentScene := aScene.
	self pushEvent: (StormSceneActivated scene: aScene).
	self pushEvent: (StormSceneUpdated scene: aScene)