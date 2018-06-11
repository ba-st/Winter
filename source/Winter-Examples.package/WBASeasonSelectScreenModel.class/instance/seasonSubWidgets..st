Screen Building
seasonSubWidgets: num
	| descr grounds walls basicGroundWidget |
	descr := WBABackgroundDescriptor backgroundAt: num.
	grounds := descr loadGroundSpritesWith: screen surface.
	walls := descr loadWallSpritesWith: screen surface.
	basicGroundWidget := self newSeasonSubWidget: { grounds first }.
	^ { 
		self newSeasonSubWidget: { grounds first . walls first } .
		basicGroundWidget .
		self newSeasonSubWidget: { grounds first . walls second } .
		basicGroundWidget .
		self newSeasonSubWidget: { grounds first . walls third } .
		basicGroundWidget .
		self newSeasonSubWidget: { grounds second } .
	}
	
	