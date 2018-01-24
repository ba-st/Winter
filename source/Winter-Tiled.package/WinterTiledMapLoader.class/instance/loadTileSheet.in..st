Parsing
loadTileSheet: aTileSheetElement in: aMap
	| sheetSizeParts sheetSizeX sheetSizeY tileSizeParts tileSizeX tileSizeY marginParts marginX marginY spacingParts spacingX spacingY image texture stopWidth stopHeight y x |
	aTileSheetElement name = #tilesheet
		ifTrue: [ | id description imageSource alignment sheetSize tileSize margin spacing |
			id := aTileSheetElement elementAt: #id.
			description := (aTileSheetElement descendantElementsNamed: #description) anyOne
				contentString.
			imageSource := (aTileSheetElement descendantElementsNamed: #image) anyOne
				attributeAt: #source.
			alignment := (aTileSheetElement descendantElementsNamed: #alignment) anyOne.
			sheetSize := alignment elementAt: #SheetSize.
			tileSize := alignment elementAt: #TileSize.
			margin := alignment elementAt: #Margin.
			spacing := alignment elementAt: #Spacing.
			sheetSizeParts := sheetSize substrings: ' x '.
			sheetSizeX := Integer readFrom: (sheetSizeParts at: 1).
			sheetSizeY := Integer readFrom: (sheetSizeParts at: 2).
			tileSizeParts := tileSize substrings: ' x '.
			tileSizeX := Integer readFrom: (tileSizeParts at: 1).
			tileSizeY := Integer readFrom: (tileSizeParts at: 2).
			marginParts := margin substrings: ' x '.
			marginX := Integer readFrom: (marginParts at: 1).
			marginY := Integer readFrom: (marginParts at: 2).
			spacingParts := spacing substrings: ' x '.
			spacingX := Integer readFrom: (spacingParts at: 1).
			spacingY := Integer readFrom: (spacingParts at: 2).
			image := self imageFrom: imageSource.
			texture := WinterTexture from: image.
			stopWidth := texture width abs - tileSizeX.
			stopHeight := texture height abs - tileSizeY.
			y := marginY.
			x := marginX.
			y <= stopHeight
				whileTrue: [ x <= stopWidth
						whileTrue: [ | tile |
							tile = WinterTile
								of:
									(WinterTextureRegion
										of: texture
										x: x
										y: y
										width: tileSizeX
										height: tileSizeY).
							aMap addTile: tile.
							x := x + tileSizeX + spacingX ].
					y := y + tileSizeY + spacingY ] ]