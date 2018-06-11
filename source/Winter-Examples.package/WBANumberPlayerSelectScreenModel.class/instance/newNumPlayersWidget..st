Screen Building
newNumPlayersWidget: num
	^ self newRowWidget: { (self textWidgetAt: num) . (self textWidgetAt: #players) } space: 40