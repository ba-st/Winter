private
newRandomSpiderTicked:  numTick

	| randomX spider |
	
	[randomX := self randomX.
	self isOccupiedAt: randomX @1] whileTrue .
	spider := SpiderInvasionSpider atPosition: randomX @ self minY of: self tick: numTick.
	self addComponent: spider.