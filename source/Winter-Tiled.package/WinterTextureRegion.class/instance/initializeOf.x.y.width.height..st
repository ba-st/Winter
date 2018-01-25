initialization
initializeOf: aTexture x: aNumber y: anotherNumber width: aWidth height: aHeight

|invertedTextureHeight invertedTextureWidth|

invertedTextureHeight := 1.0 / aTexture height .
invertedTextureWidth := 1.0 / aTexture width .

	texture := aTexture.
	self setRegionUsingU: (aNumber* invertedTextureWidth ) v: (anotherNumber* invertedTextureHeight ) u2: ((aNumber+ aWidth ) * invertedTextureWidth ) v2: ((anotherNumber+ aHeight  ) * invertedTextureHeight  ).
	regionWidth := aWidth abs.
	regionHeight := aHeight abs