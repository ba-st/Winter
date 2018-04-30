private
withIndexItemsDo: aBlock

	self minY to: self maxY do: [ :j |
		self minX to: self maxX do: [ :i |
			aBlock value: i value: j ] ]