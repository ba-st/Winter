initialization
testRemoveSound
	| system sound |
	system := WinterAssetManagementSystem  current.
	sound := WinterSound fromRelativePath: 'bird.wav'.
	system addSound: sound named: 'bird'.
	self deny: system sounds isEmpty.
	system removeSoundNamed: 'bird'.
	self assert: system sounds isEmpty