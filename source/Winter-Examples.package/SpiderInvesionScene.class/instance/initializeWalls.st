initialization
initializeWalls
	self withIndexItemsDo: [ :x :y |
		(y = self minY or: [y = self maxY]) ifFalse: [ 
			100 atRandom < 20 ifTrue: [ "20% of chances"
				self addComponent: (SpiderInvasionWall inPosition: x@y of: self ) ] ] ]