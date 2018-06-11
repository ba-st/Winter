as yet unclassified
loadGroundSpritesWith: surface
	| genForm grounds |

	grounds := Array new: 2.
	genForm := self loadImageFile.
	
	grounds at: 1 put: (surface createFormPaint: (genForm copy: ((0 @ 192 + position) corner: (48 @ 224 + position)))).
	grounds at: 2 put: (surface createFormPaint: (genForm copy: ((0 @ 240 + position) corner: (48 @ 272 + position)))).
	^ grounds