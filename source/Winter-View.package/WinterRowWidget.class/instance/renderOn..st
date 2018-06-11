rendering
renderOn: aCanvas

	widgets do: [ :widget | 
		widget renderOn: aCanvas.
		aCanvas pathTransform translateX: space Y: 0 ].
	aCanvas pathTransform translateX: (space * widgets size negated) Y: 0.