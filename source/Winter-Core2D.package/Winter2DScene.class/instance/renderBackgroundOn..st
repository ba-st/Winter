Rendering
renderBackgroundOn: aCanvas

	aCanvas setPaint: self backgroundColor.
	aCanvas drawShape: (0@0 fastCorner: game window window extent)