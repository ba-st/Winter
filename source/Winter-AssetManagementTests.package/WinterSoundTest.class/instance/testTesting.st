tests
testTesting
	| sound |
	sound := WinterSound fromRelativePath: 'bird.wav'.
	self
		assert: sound isWav;
		deny: sound isStereo;
		deny: sound isAIFF