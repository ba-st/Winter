tests
testAccessing

	| sound |

	sound := WinterSound from: SampledSound beepSound fileType: 'wav' filePath: 'beep.wav'.

	self
		assert: sound type equals: 'wav';
		assert: sound filePath equals: 'beep.wav';
		assert: sound fileName equals: 'beep'