Initialization
buildWindow
	window := (StandardWindow labelled: game title)
		extent: game dimensions + (0 @ 25);
		yourself.
	window
		addMorph: (surfaceContainer := ImageMorph new image: (Form extent: game dimensions depth: 32))
		fullFrame: (LayoutFrame fractions: (0 @ 0 corner: 1 @ 1) offsets: (0 @ 0 corner: 0 @ 0)).
	window announcer
		when: WindowClosed
		do: [ game stop.
			window := nil ]