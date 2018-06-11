Drawing
renderShape: aShape on: aCanvas
"aShape will not be a shape because there are 3 chapes here"
	walls do: [ :wall | aCanvas drawShape: (wall pathOn: aCanvas) ]