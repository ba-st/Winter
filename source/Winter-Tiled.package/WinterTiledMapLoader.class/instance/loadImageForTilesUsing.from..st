Parsing
loadImageForTilesUsing: aTileSheetElement from: source
	| offsetElement offsetX margin name tileHeight imageElement tileWidth spacing imageWidth xmlElement offsetY image imageHeight imageSource |
	source
		ifNil: [ offsetElement := aTileSheetElement elementAt: #tileoffset.
			offsetElement
				ifNil: [ "Do nothing" ]
				ifNotNil: [ offsetX := offsetElement attributeAt: #x.
					offsetY := offsetElement attributeAt: #y ].
			imageElement := aTileSheetElement elementAt: #image.
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
					image := imageSource asFileReference ] ]