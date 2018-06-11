Executing
play
	nativeAsset  isPlaying
		ifTrue: [ "Playing" ]
		ifFalse: [ nativeAsset play ]