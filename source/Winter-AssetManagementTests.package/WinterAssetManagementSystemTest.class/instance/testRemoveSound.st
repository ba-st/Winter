Tests
testRemoveSound

	| system sound |

	system := WinterAssetManagementSystem current.
	sound := WinterSound from: SampledSound beepSound fileType: 'wav' filePath: 'beep.wav'.
	system addSound: sound named: 'beep'.
	self deny: system sounds isEmpty.
	system removeSoundNamed: 'beep'.
	self assert: system sounds isEmpty