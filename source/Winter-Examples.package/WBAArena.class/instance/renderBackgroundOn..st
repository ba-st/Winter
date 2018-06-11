rendering
renderBackgroundOn: canvas
	canvas setPaint: Color gray.
	canvas drawShape: (0@0 fastCorner: screen window extent).