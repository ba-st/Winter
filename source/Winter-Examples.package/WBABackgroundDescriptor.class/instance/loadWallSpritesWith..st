as yet unclassified
loadWallSpritesWith: surface
	| genForm walls |
	walls := Array new: 3.
	genForm := self loadImageFile.
	
	0 to: 2 do: [ :i | | topLeftCorner subRect |
		topLeftCorner := 0 @ i * self wallSpriteSize + position.
		subRect := topLeftCorner corner: self wallSpriteSize + topLeftCorner.
		walls at: i + 1 put: (surface createFormPaint: (genForm copy: subRect)) ].
	^ walls