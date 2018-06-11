Tests
testAddSound

	| system  |

	system := WinterAssetManagementSystem current.

	system addSound: 'beep.wav' named: 'beep'.
	self
		deny: system assets isEmpty;
		assert: (system assetNamed:  'beep') notNil