Screen Building
newArenaWidget: numArenas
	^ self newColumnWidget: ((1 to: numArenas) collect: [ :i | self newSubArenaWidget: i ]) space: 80