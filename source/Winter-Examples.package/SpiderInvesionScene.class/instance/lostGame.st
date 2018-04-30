as yet unclassified
lostGame
	components := OrderedCollection new.
	self
		withIndexItemsDo: [ :i :j | 
			j = self maxY
				ifFalse: [ self addComponent: (SpiderInvasionExplode atPosition: i @ j of: self tick: 30) ] ]