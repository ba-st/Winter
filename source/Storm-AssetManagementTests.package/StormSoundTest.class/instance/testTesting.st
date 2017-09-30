tests
testTesting
	| sound |
	sound := StormSound fromRelativePath: 'bird.wav'.
	self
		assert: sound isWav;
		deny: sound isStereo;
		deny: sound isAIFF