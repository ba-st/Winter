tests
testTesting
	| sound |
	
	sound := WinterSound fromPath: 'beep.wav' named: 'beep'.
	
	self
		assert: sound isWav;
		deny: sound isAIFF