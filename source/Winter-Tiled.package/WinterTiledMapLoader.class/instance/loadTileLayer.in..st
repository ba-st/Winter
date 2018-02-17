Parsing - Layers
loadTileLayer: aLayerElement in: aMap

	| width height tileWidth tileHeight layer ids y x id flipHorizontally flipVertically flipDiagonally tile cell properties |

	(aLayerElement attributeAt: #name) = 'layer'
		ifTrue: [ 
			width := aLayerElement attributeAt: #width ifAbsent: [ 0 ].
			height := aLayerElement attributeAt: #height ifAbsent: [ 0 ].
			tileWidth := aMap propertiesAt: #tilewidth.
			tileHeight := aMap propertiesAt: #tileheight.
			layer := WinterTiledMapTileLayer
				ofWidth: width
				height: height
				tileWidth: tileWidth
				tileHeight: tileHeight.
			
			self loadBasicLayerInfoIn: layer using: aLayerElement.
			
			ids := self tileIdsFrom: aLayerElement accordingToWidth: width height: height.
			y := 0.
			x := 0.
			
			y < height
				whileTrue: [ x < width
						whileTrue: [ id := ids at: y * width + x.
							flipHorizontally := (id & FlagFlipHorizontally) ~= 0.
							flipVertically := (id & FlagFlipVertically) ~= 0.
							flipDiagonally := (id & FlagFlipDiagonally) ~= 0.
							tile := aMap tilesAt: id & MaskClear not.
							tile
								ifNil: [ "Do nothing" ]
								ifNotNil: [ "WinterTiledMapTileLayerCell"
									cell := self
										createTileLayerCellOf: tile
										consideringFlagFlippingHorizontally: flipHorizontally
										flagFlippingVertically: flipVertically
										andFlagFlippingDiagonally: flipDiagonally.
									"Consider for later:  flipY ? height - 1 - y : y"
									layer cellsAtX: x andY: y put: cell ].
							x := x + 1 ].
					y := y + 1 ].
			properties := aLayerElement elementAt: #properties.
			properties ifNil: [ "Do nothing" ] ifNotNil: [ self loadProperties: properties in: layer ]. 
			aMap addLayer: layer ]