screen building
newSelectWidget: sprite

	^ self 
		newRowWidget: { (self textWidgetAt: #select) . sprite }
		space: 160