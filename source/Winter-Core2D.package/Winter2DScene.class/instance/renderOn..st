Rendering
renderOn: aCanvas

	self renderBackgroundOn: aCanvas .	
	self players do: [ :eachPlayer | eachPlayer renderOn: aCanvas ].
	self components do: [ :eachComponent | eachComponent renderOn: aCanvas ]