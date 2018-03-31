Rendering
renderOn: aCanvas
	self renderBackgroundOn: aCanvas .
	"aCanvas surface clear: self backgroundColor.
	self displayScene: self surface."
	
	self players do: [ :eachPlayer | eachPlayer renderOn: aCanvas ].
	self components do: [ :eachComponent | eachComponent renderOn: aCanvas ]