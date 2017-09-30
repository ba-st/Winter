initialization
testAddSound
	| system sound|
	system := StormAssetManagementSystem current .
	sound := StormSound fromRelativePath: 'bird.wav'.
	system addSound: sound named:'bird'.
	self
		deny: system sounds isEmpty;
		assert: (system soundNamed:'bird') equals: sound
		