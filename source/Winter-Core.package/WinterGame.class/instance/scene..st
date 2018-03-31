accessing
scene: aScene
	scene := aScene.
	scene game: self.
	self pushEvent: (WinterSceneActivated scene: aScene).
	self pushEvent: (WinterSceneUpdated scene: aScene)