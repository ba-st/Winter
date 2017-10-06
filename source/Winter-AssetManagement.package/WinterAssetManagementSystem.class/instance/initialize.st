Initialization
initialize
	sounds := Dictionary new.
	sprites := Dictionary new.
	SoundSystem soundEnabled: true.
	SoundSystem initialize.
	SoundPlayer initialize