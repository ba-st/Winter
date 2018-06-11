Test Support
createSound
	| writer |
	writer := SunAudioFileWriter onFileNamed: 'beep.wav'.
	writer appendSamples: self beep samples.
	writer closeFile