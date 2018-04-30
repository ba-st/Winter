Testing
isValidPosition: aPosition

	^ self minX @ self minY <= aPosition and: [ aPosition <= (self maxX @ self maxY)  ]