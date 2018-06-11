Initialization
initialize
	assets := Dictionary new.
	SoundSystem soundEnabled: true.
	SoundSystem initialize.
	SoundPlayer startUpWithSound:nil.