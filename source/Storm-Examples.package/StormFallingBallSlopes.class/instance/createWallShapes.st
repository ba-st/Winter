initialization
createWallShapes
	^ {
		{ 0@300. 150@340 }.
		{ self dimensions x @ 420. self dimensions x - 150 @ 460 }.
		{ 30@550. 150@615 }.
		{ 225@565. 150@590 }.
	} collect: [ :each | StormBoldWallShape from: each first to: each second ]