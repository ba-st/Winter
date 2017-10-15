Drawing
drawSpriteOrShapeOn: aCanvas
	walls do: [ :wall | aCanvas drawShape: (wall pathOn: aCanvas) ]