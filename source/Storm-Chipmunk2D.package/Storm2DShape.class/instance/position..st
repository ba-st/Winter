accessing
position: aPoint

	position := aPoint.
	self physicBody
		isNil ifFalse:[
			"Since position of shape refers to topleft corner and position of body requires gravity center" 
			self physicBody position: self position "+ self gravityCenter" ]