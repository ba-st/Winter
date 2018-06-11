Bootstrap
loadSpritesWith: surface
	| sprites genForm |
	genForm := self loadImageFile.
	sprites := Array new: 6.
	1 to: 6 do: [ :i | | point |
		point := i - 1 @ 0 * self spriteSize.
		sprites at: i put: (surface createFormPaint: (genForm copy: (point corner: self spriteSize + point))) ].
	^ sprites