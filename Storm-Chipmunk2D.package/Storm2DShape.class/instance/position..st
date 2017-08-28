accessing
position: aPoint 
	position := aPoint.
	self physicBody ifNotNil: [ :body | 
		"Since position of shape refers to topleft corner and position of body requires gravity center"
		body position: (self position + self gravityCenter) ]