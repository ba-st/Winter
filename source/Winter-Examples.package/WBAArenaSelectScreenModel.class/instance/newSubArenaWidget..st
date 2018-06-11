Screen Building
newSubArenaWidget: num
	^ self newRowWidget: { (self textWidgetAt: #arena) . (self textWidgetAt: num) } space: 170