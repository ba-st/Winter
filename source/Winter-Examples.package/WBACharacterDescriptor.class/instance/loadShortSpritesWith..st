Bootstrap
loadShortSpritesWith: surface
	| genForm sprites |
	genForm := self loadImageFile.
	sprites := Array new: 2.
	0 to: 1 do: [ :i | | topLeftCorner |
		topLeftCorner := i @ 0 * (self spriteSize * 2) + position.
		sprites 
			at:  i + 1 
			put: (surface createFormPaint: (genForm copy: (topLeftCorner corner: self spriteSize + topLeftCorner))) ].
	^ sprites