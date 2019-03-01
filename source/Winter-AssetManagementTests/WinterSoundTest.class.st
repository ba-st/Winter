Class {
	#name : #WinterSoundTest,
	#superclass : #TestCase,
	#category : 'Winter-AssetManagementTests'
}

{ #category : #testing }
WinterSoundTest >> expectedFailures [
	^ #(testAccessing testTesting)
]

{ #category : #tests }
WinterSoundTest >> testAccessing [

	| sound |

	sound := WinterSound fromPath: 'beep.wav' named: 'beep'.

	self
		assert: sound type equals: 'wav';
		assert: sound filePath equals: 'beep.wav';
		assert: sound fileName equals: 'beep'
]

{ #category : #tests }
WinterSoundTest >> testInstanceCreationFailedBecauseExtensionNotSupported [
	self
		should: [ WinterSound fromPath: 'bird2.mp3' named: 'bird'.]
		raise: SoundExtensionNotSupported 
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'mp3 not supported, only .aiff and .wav extension supported for now' ].
]

{ #category : #tests }
WinterSoundTest >> testInstanceCreationFailedBecauseFileNotFound [
	self
		should: [ WinterSound fromPath: 'bird2.wav' named: 'bird2'.]
		raise: FileDoesNotExist
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'File does not exist: bird2.wav' ].
]

{ #category : #tests }
WinterSoundTest >> testTesting [
	| sound |
	
	sound := WinterSound fromPath: 'beep.wav' named: 'beep'.
	
	self
		assert: sound isWav;
		deny: sound isAIFF
]
