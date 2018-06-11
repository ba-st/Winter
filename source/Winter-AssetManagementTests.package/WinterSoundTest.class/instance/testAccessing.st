tests
testAccessing

	| sound |

	sound := WinterSound fromPath: 'beep.wav' named: 'beep'.

	self
		assert: sound type equals: 'wav';
		assert: sound filePath equals: 'beep.wav';
		assert: sound fileName equals: 'beep'