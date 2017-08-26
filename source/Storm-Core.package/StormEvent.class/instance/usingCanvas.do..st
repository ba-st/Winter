canvas
usingCanvas: aCanvas do: aBlock
	usingCanvas := aCanvas. 
	aBlock ensure: [ usingCanvas := nil ]