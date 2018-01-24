initialization
initializeOf: aTexture x: aNumber y: anotherNumber width: aWidth height: aHeight

|invertedTextureHeight invertedTextureWidth|

invertedTextureHeight := 1.0 / aTexture height .
invertedTextureWidth := 1.0 / aTexture width .

	texture := aTexture.
	self setRegionUsingU: (x* invertedTextureWidth ) v: (y* invertedTextureHeight ) u2: ((x+ aWidth ) * invertedTextureWidth ) v2: ((y+ aHeight  ) * invertedTextureHeight  ).
	regionWidth := aWidth abs.
	regionHeight := aHeight abs