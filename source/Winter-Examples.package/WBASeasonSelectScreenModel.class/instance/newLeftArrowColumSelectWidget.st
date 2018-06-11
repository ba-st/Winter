Screen Building
newLeftArrowColumSelectWidget
	| w |
	w := self textWidgetAt: #arrowLeft1.
	^ self newColumnWidget: { w . w . w } space: 80.