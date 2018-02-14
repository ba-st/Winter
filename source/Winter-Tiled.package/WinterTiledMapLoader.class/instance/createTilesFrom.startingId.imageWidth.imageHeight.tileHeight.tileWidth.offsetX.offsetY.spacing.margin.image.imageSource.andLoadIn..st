Parsing - Tilesets
createTilesFrom: xmlElement startingId: firstgid imageWidth: imageWidth imageHeight: imageHeight tileHeight: tileHeight tileWidth: tileWidth offsetX: offsetX offsetY: offsetY spacing: spacing margin: margin image: image imageSource: imageSource andLoadIn: tileset
	| x stopWidth id tileElements tileImageWidth tileRegion textureRegion tileImageHeight y tileImageSource tile stopHeight tileImage |
	image
		ifNil: [ tileElements := xmlElement descendantElementsNamed: #tile.
			tileElements
				do: [ :tileElement | 
					| tileImageElement |
					tileImageElement := tileElement elementAt: #image.
					tileImageElement
						ifNil: [ "Do nothing" ]
						ifNotNil: [ tileImageSource := tileImageElement attributeAt: #source.
							tileImageWidth := tileImageElement attributeAt: #width.
							tileImageHeight := tileImageElement attributeAt: #height.
							imageSource
								ifNil: [ tileImage := tileImageSource asFileReference ]
								ifNotNil: [ tileImage := imageSource asFileReference / tileImageSource asPath ] ].
					textureRegion := self textureRegionFromFile: tileImage.
					"Should consider this for future: flipY ? -offsetY : offsetY"
					tile := WinterTiledMapTile
						of: textureRegion
						havingOffsetX: offsetX
						andOffsetY: offsetY.
					tile id: (firstgid + tileElement attributeAt: #id).
					tileset tilesAt: tile id put: tile ] ]
		ifNotNil: [ textureRegion := self textureRegionFromFile: image.
			tileset
				propertiesAt: 'imagesource' put: imageSource;
				propertiesAt: 'imagewidth' put: imageWidth;
				propertiesAt: 'imageheight' put: imageHeight;
				propertiesAt: 'tilewidth' put: tileWidth;
				propertiesAt: 'tileheight' put: tileHeight;
				propertiesAt: 'margin' put: margin;
				propertiesAt: 'spacing' put: spacing.
			stopWidth := textureRegion regionWidth - tileWidth.
			stopHeight := textureRegion regionHeight - tileHeight.
			id := firstgid.
			y := margin.
			x := margin.
			y <= stopHeight
				whileTrue: [ x <= stopWidth
						whileTrue: [ ""
							tileRegion := WinterTextureRegion
								of: textureRegion texture
								x: textureRegion x + x
								y: textureRegion y + y
								width: tileWidth
								height: tileHeight.
							"Should consider this for future: flipY ? -offsetY : offsetY"
							tile := WinterTiledMapTile
								of: tileRegion
								havingOffsetX: offsetX
								andOffsetY: offsetY.
							tile id: id.
							tileset tilesAt: id put: tile.
							id := id + 1.
							x := x + tileWidth + spacing ].
					y := y + tileHeight + spacing ] ]