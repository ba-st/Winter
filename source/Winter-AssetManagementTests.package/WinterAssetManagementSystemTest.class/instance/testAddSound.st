initialization
testAddSound
	| system sound|
	system := WinterAssetManagementSystem current .
	sound := WinterSound fromRelativePath: 'bird.wav'.
	system addSound: sound named:'bird'.
	self
		deny: system sounds isEmpty;
		assert: (system soundNamed:'bird') equals: sound
		