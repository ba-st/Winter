rendering
renderElementsOn: canvas
	self 
		renderCells: [ :cell | | elements |
			elements := (cell spells , { cell element }) sort: [ :a :b | a movingShift y < b movingShift y ].
			elements do: [ :sp | sp renderOn: canvas ] ]
		on: canvas 