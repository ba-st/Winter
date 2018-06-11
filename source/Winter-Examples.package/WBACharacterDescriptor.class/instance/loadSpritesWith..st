Bootstrap
loadSpritesWith: surface
	| genForm sprites |
	genForm := self loadImageFile.
	sprites := Array new: 12.
	0 to: 3 do: [ :j | 
		0 to: 2 do: [ :i | | topLeftCorner |
			topLeftCorner := i @ j * self spriteSize + position.
			sprites 
				at: j * 3 + i + 1 
				put: (surface createFormPaint: (genForm copy: (topLeftCorner corner: self spriteSize + topLeftCorner))) ] ].
	^ sprites