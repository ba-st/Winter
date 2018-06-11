as yet unclassified
renderOn: aCanvas

	widgets do: [ :widget | 
		widget renderOn: aCanvas.
		aCanvas pathTransform translateX: 0 Y: space ].
	aCanvas pathTransform translateX: 0 Y: (space * widgets size negated).