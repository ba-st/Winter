Bootstrap
loadExplodeSpritesWith: surface
	| sprites genForm |
	genForm := self loadImageFile.
	sprites := Array new: 3.
	4 to: 6 do: [ :i | | point |
		point := i - 1 @ 0 * self spriteSize.
		sprites at: i - 3 put: (surface createFormPaint: (genForm copy: (point corner: self spriteSize + point))) ].
	^ sprites