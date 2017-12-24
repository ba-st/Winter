tests
testTesting
	| sound |
	
	sound := WinterSound from: SampledSound beepSound fileType: 'wav' filePath: 'beep.wav'.
	
	self
		assert: sound isWav;
		deny: sound isStereo;
		deny: sound isAIFF