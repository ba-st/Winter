tests
testAccessing
	| sound |
	sound := StormSound fromRelativePath: 'bird.wav'.
	self
		assert: sound type equals: 'wav';
		assert: sound filePath equals: 'bird.wav';
		assert: sound fileName equals: 'bird'