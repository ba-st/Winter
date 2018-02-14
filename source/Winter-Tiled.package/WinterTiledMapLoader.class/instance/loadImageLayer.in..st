Parsing - Layers
loadImageLayer: aLayerElement in: aMap

	| x y image source textureRegion layer properties |
	
	(aLayerElement attributeAt: #name) = 'imagelayer'
		ifTrue: [ 
			x := 0.
			y := 0.
			(aLayerElement includesAttribute: #offsetx)
				ifTrue: [ 
					x := Integer
						readFrom: (aLayerElement attributeAt: #offsetx ifAbsent: [ '0' ]) ]
				ifFalse: [ 
					x := Integer
						readFrom: (aLayerElement attributeAt: #x ifAbsent: [ '0' ]) ].
			(aLayerElement includesAttribute: #offsety)
				ifTrue: [ 
					y := Integer
						readFrom: (aLayerElement attributeAt: #offsety ifAbsent: [ '0' ]) ]
				ifFalse: [ 
					y := Integer
						readFrom: (aLayerElement attributeAt: #y ifAbsent: [ '0' ]) ].

			"if (flipY) y = mapHeightInPixels - y;"
			image := aLayerElement elementAt: #image.
			image
				ifNil: [ "Do nothing" ]
				ifNotNil: [ 
					source := image attributeAt: #source.
					textureRegion := WinterTextureRegion
						of: (WinterTexture from: (self imageFrom: source)).
					y := y - textureRegion regionHeight ].
			layer := WinterTiledMapImageLayer of: textureRegion atX: x andAtY: y.
			self loadBasicLayerInfoIn: layer using: aLayerElement.
			properties := aLayerElement elementAt: #properties.
			properties
				ifNil: [ "Do nothing" ]
				ifNotNil: [ self loadProperties: properties in: layer ].
			aMap addLayer: layer ]
		ifFalse: [ "Do nothing" ]