Screen Building
newRightArrowColumSelectWidget
	| w |
	w := self textWidgetAt: #arrowRight1.
	^ self newColumnWidget: { w . w . w } space: 80.