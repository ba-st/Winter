screen building
newLargeArrowSelectWidget: space

	^ self 
		newRowWidget: { (self textWidgetAt: #arrowLeft0) . (self textWidgetAt: #arrowRight0) } 
		space: space