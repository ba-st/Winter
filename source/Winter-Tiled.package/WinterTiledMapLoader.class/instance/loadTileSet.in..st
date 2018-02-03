Parsing
loadTileSet: aTileSetElement in: aMap
	aTileSetElement name = #tileset
		ifTrue:
			[ | firstgid name tileHeight tileWidth source imageSource margin spacing image offsetY offsetX imageWidth imageHeight offsetElement imageElement tileset xmlElement |
			xmlElement := aTileSetElement.
			firstgid := xmlElement elementAt: #firstgid.
			name := xmlElement attributeAt: #name.
			tileHeight := xmlElement attributeAt: #tileheight.
			tileWidth := xmlElement attributeAt: #tilewidth.
			spacing := xmlElement attributeAt: #spacing.
			margin := xmlElement attributeAt: #margin.
			source := xmlElement attributeAt: #source.
			offsetX := 0.
			offsetY := 0.
			imageWidth := 0.
			imageHeight := 0.
			source
				ifNil: [ offsetElement := aTileSetElement elementAt: #tileoffset.
					offsetElement
						ifNil: [ "Do nothing" ]
						ifNotNil: [ offsetX := offsetElement attributeAt: #x.
							offsetY := offsetElement attributeAt: #y ].
					imageElement := aTileSetElement elementAt: #image.
					imageElement
						ifNil: [ "Do nothing" ]
						ifNotNil: [ imageSource := imageElement attributeAt: #source.
							imageWidth := imageElement attributeAt: #width.
							imageHeight := imageElement attributeAt: #height.
							image := imageSource asFileReference ] ]
				ifNotNil: [ | tsxFile |
					tsxFile := source asFileReference.
					xmlElement := tsxFile
						binaryReadStreamDo: [ :stream | stream parseXML ].
					name := xmlElement attributeAt: #name.
					tileHeight := xmlElement attributeAt: #tileheight.
					tileWidth := xmlElement attributeAt: #tilewidth.
					spacing := xmlElement attributeAt: #spacing.
					margin := xmlElement attributeAt: #margin.
					offsetElement = xmlElement elementAt: #tileoffset.
					offsetElement
						ifNil: [ "Do nothing" ]
						ifNotNil: [ offsetX := offsetElement attributeAt: #x.
							offsetY := offsetElement attributeAt: #y ].
					imageElement := xmlElement elementAt: #image.
					imageElement
						ifNil: [ "Do nothing" ]
						ifNotNil: [ imageSource := imageElement attributeAt: #source.
							imageWidth := imageElement attributeAt: #width.
							imageHeight := imageElement attributeAt: #height.
							image := imageSource asFileReference ] ].
			tileset := WinterTiledMapTileSet named: name.
			tileset propertiesAt: 'firstgid' put: firstgid.
			self
				createTilesFrom: xmlElement
				startingId: firstgid
				imageWidth: imageWidth
				imageHeight: imageHeight
				tileHeight: tileHeight
				tileWidth: tileWidth
				offsetX: offsetX
				offsetY: offsetY
				spacing: spacing
				margin: margin
				image: image
				imageSource: imageSource
				andLoadIn: tileset
			 ]