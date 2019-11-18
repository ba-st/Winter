Class {
	#name : #WinterSoundTest,
	#superclass : #TestCase,
	#instVars : [
		'fileSystem'
	],
	#category : #'Winter-AssetManagementTests'
}

{ #category : #testing }
WinterSoundTest >> expectedFailures [

	^ #(testAccessing)
]

{ #category : #tests }
WinterSoundTest >> setUp [

	super setUp.
	fileSystem := FileSystem memory
]

{ #category : #tests }
WinterSoundTest >> testAccessing [

	| sound |

	sound := WinterSound fromPath: 'beep.wav' named: 'beep' using: fileSystem.

	self
		assert: sound type equals: 'wav';
		assert: sound filePath equals: 'beep.wav';
		assert: sound fileName equals: 'beep'
]

{ #category : #tests }
WinterSoundTest >> testInstanceCreationFailedBecauseExtensionNotSupported [

	self
		should: [ WinterSound fromPath: 'bird2.mp3' named: 'bird' using: fileSystem ]
		raise: SoundExtensionNotSupported
		withExceptionDo:
			[ :ex | self assert: ex messageText equals: 'mp3 not supported, only  .wav extension supported for now' ]
]

{ #category : #tests }
WinterSoundTest >> testInstanceCreationFailedBecauseFileNotFound [

	self
		should: [ WinterSound fromPath: 'bird2.wav' named: 'bird2' using: fileSystem ]
		raise: FileDoesNotExistException
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'File does not exist: bird2.wav' ]
]
