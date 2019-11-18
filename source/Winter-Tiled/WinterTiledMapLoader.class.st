"
A Loader for TileMaps from Tmx files
"
Class {
	#name : #WinterTiledMapLoader,
	#superclass : #Object,
	#instVars : [
		'xmlParsed',
		'flipY',
		'mapTileWidth',
		'mapTileHeight',
		'mapWidthInPixels',
		'mapHeightInPixels'
	],
	#classVars : [
		'FlagFlipDiagonally',
		'FlagFlipHorizontally',
		'FlagFlipVertically',
		'MaskClear'
	],
	#category : #'Winter-Tiled'
}

{ #category : #'Instance Creation' }
WinterTiledMapLoader class >> initialize [

	"Cambiar los strings por hexadecimales"

	FlagFlipHorizontally := '0x80000000'.
	FlagFlipVertically := '0x40000000'.
	FlagFlipDiagonally := '0x20000000'.
	MaskClear := '0xE0000000'
]

{ #category : #'Instance Creation' }
WinterTiledMapLoader class >> loadFromPath: aStringPath [

	^ [ self new initializeFromPath: aStringPath asPath ]
		on: FileDoesNotExist
		do:
			[ :ex | (ex messageText: ('TiledMap not found in <1s>' expandMacrosWith: aStringPath)) signal ]
]

{ #category : #'Parsing - Layers' }
WinterTiledMapLoader >> createTileLayerCellOf: aTile consideringFlagFlippingHorizontally: aFlipHorizontallyFlag flagFlippingVertically: aFlipVerticallyFlag andFlagFlippingDiagonally: aFlipDiagonallyFlag [
	
	| horizontally vertically rotation |
	
	aFlipDiagonallyFlag
		ifTrue: [ vertically := true.
			rotation := WinterTiledMapTileLayerCell rotate270.
			aFlipHorizontallyFlag
				ifTrue: [ horizontally := true.
					vertically := false ].
			aFlipVerticallyFlag
				ifTrue: [ vertically := true.
					rotation := WinterTiledMapTileLayerCell rotate90 ] ]
		ifFalse: [ vertically := aFlipVerticallyFlag.
			horizontally := aFlipHorizontallyFlag.
			rotation := WinterTiledMapTileLayerCell rotate0 ].
	^ WinterTiledMapTileLayerCell
		of: aTile
		flippingHorizontally: horizontally
		flippingVertically: vertically
		rotating: rotation
]

{ #category : #'Parsing - Tilesets' }
WinterTiledMapLoader >> createTilesFrom: xmlElement startingId: firstgid imageWidth: imageWidth imageHeight: imageHeight tileHeight: tileHeight tileWidth: tileWidth offsetX: offsetX offsetY: offsetY spacing: spacing margin: margin image: image imageSource: imageSource andLoadIn: tileset [
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
					tile := WinterTiledMapTile of: textureRegion havingOffsetX: offsetX andOffsetY: offsetY.
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
			margin
				ifNil: [ y := 0.
					x := 0 ]
				ifNotNil: [ y := margin.
					x := margin ].
			[ y <= stopHeight ]
				whileTrue: [ [ x <= stopWidth ]
						whileTrue: [ ""
							tileRegion := WinterTextureRegion
								of: textureRegion texture
								x: textureRegion x + x
								y: textureRegion y + y
								width: tileWidth
								height: tileHeight.
							"Should consider this for future: flipY ? -offsetY : offsetY"
							tile := WinterTiledMapTile of: tileRegion havingOffsetX: offsetX andOffsetY: offsetY.
							tile id: id.
							tileset tilesAt: id put: tile.
							id := id + 1.
							x := x + tileWidth + spacing ].
					y := y + tileHeight + spacing ] ]
]

{ #category : #private }
WinterTiledMapLoader >> imageFrom: imagePathString [
	^ imagePathString asFileReference 
]

{ #category : #Initialization }
WinterTiledMapLoader >> initialize [

	flipY := true.
	mapTileWidth := 0.
	mapTileHeight := 0.
	mapWidthInPixels := 0.
	mapHeightInPixels := 0
]

{ #category : #Initialization }
WinterTiledMapLoader >> initializeFromPath: aPath [

	xmlParsed := aPath asFileReference binaryReadStreamDo: [ :stream | stream parseXML ]
]

{ #category : #'Parsing - Layers' }
WinterTiledMapLoader >> loadBasicLayerInfoIn: aLayer using: aLayerElement [

	| name opacity visible offsetX offsetY |
	
	name := aLayerElement attributeAt: #name ifAbsent: [ nil ].
	opacity := Float readFrom: (aLayerElement attributeAt: #opacity ifAbsent: [ '1.0' ]).
	visible := (aLayerElement attributeAt: #visible ifAbsent: [ 1 ]) = 1.
	offsetX := Float readFrom: (aLayerElement attributeAt: #offsetx ifAbsent: [ '0.0' ]).
	offsetY := Float readFrom: (aLayerElement attributeAt: #offsety ifAbsent: [ '0.0' ]).
	
	aLayer
		name: name;
		opacity: opacity;
		visible: visible;
		offsetX: offsetX;
		offsetY: offsetY
]

{ #category : #'Parsing - Tilesets' }
WinterTiledMapLoader >> loadImageForTilesUsing: aTileSheetElement from: source [
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
]

{ #category : #'Parsing - Layers' }
WinterTiledMapLoader >> loadImageLayer: aLayerElement in: aMap [

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
]

{ #category : #'Parsing - Layers' }
WinterTiledMapLoader >> loadLayer: aLayerElement in: aMap [
	"Check this later"
	self loadTileLayer: aLayerElement in: aMap
]

{ #category : #'Parsing - Layers' }
WinterTiledMapLoader >> loadObject: anObjectElement in: aLayer considering: aMap [

	| scaleX scaleY x y width height points vertices point polyline polygon gid id flipHorizontally flipVertically tile rotation type properties tiledMapTileMapObject textureRegion objectWidth objectHeight |
	
	(anObjectElement attributeAt: #name) = 'object'
		ifTrue: [ 
			| object |
			
			object := nil.
			"Consider this later: convertObjectToTileSpace ? 1.0f / mapTileWidth : 1.0f"
			scaleX := 1.0.
			"Consider this later: convertObjectToTileSpace ? 1.0f / mapTileHeight : 1.0f"
			scaleY := 1.0.
			x := (anObjectElement attributeAt: #x ifAbsent: [ 0 ]) asFloat
				* scaleX.

			"Consider this later: (flipY ? (heightInPixels - element.getFloatAttribute('y', 0)) : element.getFloatAttribute('y', 0)) * scaleY"
			y := (anObjectElement attributeAt: #y ifAbsent: [ 0 ]) asFloat
				* scaleY.
			width := (anObjectElement attributeAt: #width ifAbsent: [ 0 ])
				asFloat * scaleX.
			height := (anObjectElement attributeAt: #height ifAbsent: [ 0 ])
				asFloat * scaleY.
			anObjectElement hasChildren
				ifTrue: [ 
					| child |
					
					child := anObjectElement elementAt: #polygon.
					child
						ifNil: [ child := anObjectElement elementAt: #polyline.
							child
								ifNil: [ child := anObjectElement elementAt: #ellipse.
									child
										ifNil: [ "Do nothing" ]
										ifNotNil: [ "Consider this later: flipY ? y - height : y"
											object := WinterEllipseMapObject
												of:
													(EllipseMorph new
														position: x @ y;
														extent: width @ height;yourself ) ] ]
								ifNotNil: [ 
									points := (child attributeAt: #points) substrings.
									vertices := Array new: points size * 2.
									(1 to: points size)
										do: [ :index | 
											point := points substrings: ','.
											vertices
												at: index * 2
												put: (Float readFrom: (point at: 1)) * scaleX.
											"Consider for later: (flipY ? -1 : 1)"
											vertices
												at: index * 2 + 1
												put: (Float readFrom: (point at: 2)) * scaleY * 1 ].
									polyline := LineSegment controlPoints: vertices.
									object := WinterPolylineMapObject of: polyline atX: x andY: y ] ]
						ifNotNil: [ 
							points := (child attributeAt: #points) substrings.
							vertices := Array new: points size * 2.
							(1 to: points size)
								do: [ :index | 
									point := points substrings: ','.
									vertices
										at: index * 2
										put: (Float readFrom: (point at: 1)) * scaleX.
									"Consider for later: (flipY ? -1 : 1)"
									vertices
										at: index * 2 + 1
										put: (Float readFrom: (point at: 2)) * scaleY * 1 ].
							polygon := Polygon vertices: vertices.
							object := WinterPolygonMapObject of: polygon atX: x andY: y ] ]
				ifFalse: [ "Do nothing" ].
			object
				ifNil: [ 
					gid := anObjectElement attributeAt: #gid ifAbsent: [ nil ].
					gid
						ifNil:
							[ "object = new RectangleMapObject(x, flipY ? y - height : y, width, height);" ]
						ifNotNil: [ id := Integer readFrom: gid.
							flipHorizontally := (id & FlagFlipHorizontally) ~= 0.
							flipVertically := (id & FlagFlipVertically) ~= 0.
							tile := aMap tilesAt: id & MaskClear not.
							tiledMapTileMapObject := WinterTiledMapTileMapObject
								from: tile
								horizontally: flipHorizontally
								vertically: flipVertically.
							textureRegion := tiledMapTileMapObject textureRegion.
							tiledMapTileMapObject propertiesAt: 'gid' put: id.
							tiledMapTileMapObject x: x.
							"Consider later: (flipY ? y : y - height)"
							tiledMapTileMapObject y: y.
							objectWidth := Float
								readFrom:
									(anObjectElement
										attributeAt: #width
										ifAbsent: [ textureRegion regionWidth ]).
							objectHeight := Float
								readFrom:
									(anObjectElement
										attributeAt: #height
										ifAbsent: [ textureRegion regionHeight ]).
							tiledMapTileMapObject
								scaleX: scaleX * (objectWidth / textureRegion regionWidth).
							tiledMapTileMapObject
								scaleY: scaleY * (objectHeight / textureRegion regionHeight).
							tiledMapTileMapObject
								rotation:
									(Float
										readFrom: (anObjectElement attributeAt: #rotation ifAbsent: [ 0 ])).
							object := tiledMapTileMapObject ] ]
				ifNotNil: [ "Do nothing" ].
			object name: (anObjectElement attributeAt: #name ifAbsent: [ nil ]).
			rotation := anObjectElement attributeAt: #rotation ifAbsent: [ nil ].
			rotation
				ifNil: [ "Do nothing" ]
				ifNotNil: [ object propertiesAt: 'rotation' put: (Float readFrom: rotation) ].
			type := anObjectElement attributeAt: #type ifAbsent: [ nil ].
			type
				ifNil: [ "Do nothing" ]
				ifNotNil: [ object propertiesAt: 'type' put: type ].
			id := anObjectElement attributeAt: #id ifAbsent: [ 0 ].
			id isZero
				ifTrue: [ "Do nothing" ]
				ifFalse: [ object propertiesAt: 'id' put: id ].
			object propertiesAt: #x put: x.

			"Consider this later for WinterTiledMapTileMapObject: flipY ? y - height : y"
			object propertiesAt: #y put: y.
			object propertiesAt: #width put: width.
			object propertiesAt: #height put: height.
			object
				visible: (anObjectElement attributeAt: #visible ifAbsent: [ 1 ]) = 1.
			properties := anObjectElement elementAt: #properties.
			properties
				ifNil: [ "Do nothing" ]
				ifNotNil: [ self loadProperties: properties in: object ].
			aLayer addObject: object ]
		ifFalse: [ "Do nothing" ]
]

{ #category : #'Parsing - Layers' }
WinterTiledMapLoader >> loadObjectGroup: aLayerElement in: aMap [

	| layer properties objects |

	(aLayerElement attributeAt: #name) = 'objectgroup'
		ifTrue: [ 
			layer := WinterTiledMapObjectsLayer new.
			self loadBasicLayerInfoIn: layer using: aLayerElement.
			properties := aLayerElement elementAt: #properties.
			properties ifNil: [ "Do nothing" ] ifNotNil: [ self loadProperties: properties in: layer ].
			objects := aLayerElement descendantElementsNamed: #object.
			objects do: [ :object | self loadObject: object in: layer considering: aMap ].
			aMap addLayer: layer ]
		ifFalse: [ "Do nothing" ]
]

{ #category : #private }
WinterTiledMapLoader >> loadProperties: aPropertiesElement in: aMapOrLayerOrMapObject [
	aPropertiesElement
		ifNil: [ "Do nothing" ]
		ifNotNil: [ | properties |
			properties := aPropertiesElement descendantElementsNamed: #property.
			properties
				do: [ :property | 
					| name value type transformedProperty |
					name := property attributeAt: #name ifAbsent: [ nil ].
					value := property attributeAt: #value ifAbsent: [ nil ].
					type := property attributeAt: #type ifAbsent: [ nil ].
					value ifNil: [ value := property firstNode ] ifNotNil: [ "Do nothing" ].
					transformedProperty := self propertyAccordingToName: name value: value andType: type.
					aMapOrLayerOrMapObject propertiesAt: name put: transformedProperty ] ]
		
]

{ #category : #'Parsing - Layers' }
WinterTiledMapLoader >> loadTileGroup: aLayerElement in: aMap [

	| groupLayer properties |

	(aLayerElement attributeAt: #name) = 'group'
		ifTrue: [ 
			groupLayer := WinterTiledMapTileGroupLayer new.
			self loadBasicLayerInfoIn: groupLayer using: aLayerElement.
			properties := aLayerElement elementAt: #properties.
			properties ifNil: [ "Do nothing" ] ifNotNil: [ self loadProperties: properties in: groupLayer ].
			aLayerElement descendantElements do: [ :element | self loadLayer: element in: groupLayer	"Check Polymorphysm here" ].
			groupLayer layers do: [ :layer | layer parent: groupLayer	"Check this" ].
			aMap addLayer: groupLayer ]
		ifFalse: [ "Do nothing" ]
]

{ #category : #'Parsing - Layers' }
WinterTiledMapLoader >> loadTileLayer: aLayerElement in: aMap [

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
]

{ #category : #'Parsing - Tilesets' }
WinterTiledMapLoader >> loadTileSet: aTileSetElement in: aMap [
	| firstgid name tileHeight tileWidth source imageSource margin spacing image offsetY offsetX imageWidth imageHeight offsetElement imageElement tileset xmlElement gridElement|
	xmlElement := aTileSetElement.
	firstgid := (xmlElement attributeAt: #firstgid) asNumber.
	name := xmlElement attributeAt: #name.
	tileHeight := (xmlElement attributeAt: #tileheight) asNumber.
	tileWidth := (xmlElement attributeAt: #tilewidth) asNumber.
	spacing := (xmlElement attributeAt: #spacing) ifEmpty:[nil]  ifNotEmpty: [:stringNumber | stringNumber asNumber ].
	margin := (xmlElement attributeAt: #margin) ifEmpty:[nil]  ifNotEmpty: [:stringNumber | stringNumber asNumber ].
	source := (xmlElement attributeAt: #source) ifEmpty: [ nil ] ifNotEmpty: [:aString| aString ].
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
				
			gridElement := aTileSetElement elementAt: #grid.
			gridElement
				ifNil: [ "Do nothing" ]
				ifNotNil: [ "Ignored by now" ].
				
			imageElement := aTileSetElement elementAt: #image.
			imageElement
				ifNil: [ "Do nothing" ]
				ifNotNil: [ imageSource := imageElement attributeAt: #source.
					imageWidth := (imageElement attributeAt: #width) asNumber .
					imageHeight := (imageElement attributeAt: #height) asNumber .
					image := imageSource asFileReference ] ]
		ifNotNil: [ | tsxFile |
			tsxFile := source asFileReference.
			xmlElement := tsxFile binaryReadStreamDo: [ :stream | stream parseXML ].
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

{ #category : #'Parsing - Layers' }
WinterTiledMapLoader >> propertyAccordingToName: aName value: aValue andType: aType [
	^ aType
		ifNil: [ aValue ]
		ifNotNil: [ aType = 'int'
				ifTrue: [ Integer readFrom: aValue ]
				ifFalse: [ aType = 'float'
						ifTrue: [ Float readFrom: aValue ]
						ifFalse: [ aType = 'bool'
								ifTrue: [ Boolean readFrom: aValue ]
								ifFalse: [ aType = 'color'
										ifTrue: [ Color fromString: aValue ]
										ifFalse: [ Error
												signal: ('Wrong type given for property <1s>, given : <2s>, supported : string, bool, int, float, color' expandMacrosWith: aName with: aType) ] ] ] ] ]
]

{ #category : #Parsing }
WinterTiledMapLoader >> textureFiles [
	| images tileSetsElement |
	images := OrderedCollection new.
	tileSetsElement := (xmlParsed descendantElementsNamed: #tileset) .
	images := tileSetsElement
		collect: [ :tileSet | 
			| imageSource |
			imageSource := (tileSet descendantElementsNamed: #image) anyOne.
			self imageFrom: (imageSource  attributeAt: #source) ].
	^ images
]

{ #category : #private }
WinterTiledMapLoader >> textureRegionFromFile: aFileReference [
	^ WinterTextureRegion of: (WinterTexture from: aFileReference)
]

{ #category : #'Parsing - Tilesets' }
WinterTiledMapLoader >> tileIdsFrom: aLayerElement accordingToWidth: aWidth height: aHeight [
	
	| dataElement encoding ids datas compression inputStream byteArray y x readBytePosition nextReadBytesPosition |
	
	dataElement := aLayerElement elementAt: #data ifAbsent: [ nil ].
	encoding := dataElement attributeAt: #encoding ifAbsent: [ nil ].
	ids := Array new: aWidth * aHeight.

	"no 'encoding' attribute means that the encoding is XML"
	encoding
		ifNil: [ Error signal: 'Unsuported encoding (XML) for TMX Layer Data' ]
		ifNotNil: [ encoding = 'cvs'
				ifTrue: [ datas := dataElement firstNode asString substrings: ','.
					ids := datas collect: [ :each | Integer readFrom: each trim ] asArray ]
				ifFalse: [ encoding = 'base64'
						ifTrue: [ compression := dataElement attributeAt: #compression ifAbsent: [ nil ].
							compression
								ifNil: [ inputStream := Base64MimeConverter mimeDecodeToBytes: dataElement firstNode asString ]
								ifNotNil: [ compression = 'gzip'
										ifTrue: [ inputStream := GZipReadStream on: (Base64MimeConverter mimeDecodeToBytes: dataElement firstNode asString) ]
										ifFalse: [ compression = 'zlib'
												ifTrue: [ inputStream := ZLibReadStream on: (Base64MimeConverter mimeDecodeToBytes: dataElement firstNode asString) ]
												ifFalse: [ Error signal: ('Unrecognised compression (<1s>) for TMX Layer Data' expandMacrosWith: compression) ] ] ].
							byteArray := ByteArray new: 4.
							y := 0.
							x := 0.
							self flag: 'Cambiar los whileTrue y refactorizar'.
							y < aHeight
								whileTrue: [ x < aWidth
										whileTrue: [ readBytePosition := inputStream next: 1 into: byteArray.
											readBytePosition < byteArray size
												whileTrue: [ nextReadBytesPosition := inputStream readInto: byteArray startingAt: readBytePosition count: byteArray size - readBytePosition.
													nextReadBytesPosition = 1 negated
														ifTrue: [ readBytePosition := byteArray size ]
														ifFalse: [ readBytePosition := readBytePosition + nextReadBytesPosition ] ].
											readBytePosition ~= byteArray size
												ifTrue: [ Error signal: 'Error Reading TMX Layer Data: Premature end of tile data' ]
												ifFalse: [ ids
														at: y * aWidth + x
														put:
															(byteArray at: 1) asInteger | ((byteArray at: 2) asInteger << 8) | ((byteArray at: 3) asInteger << 16)
																| ((byteArray at: 4) asInteger << 24) ].
											x := x + 1 ].
									y := y + 1 ].
							^ ids ]
						ifFalse: [ Error signal: ('Unrecognised encoding ( <1s> ) for TMX Layer Data' expandMacrosWith: encoding) ] ] ]
]

{ #category : #Parsing }
WinterTiledMapLoader >> tiledMap [

	| map tileSets layers objectGroups mapOrientation mapWidth mapHeight tileWidth tileHeight hexSideLength staggerAxis staggerIndex  mapBackgroundColor  nextlayerid nextobjectid |

	map := WinterTiledMap new.
	xmlParsed := xmlParsed elementAt: #map.
	mapOrientation := xmlParsed attributeAt: #orientation ifAbsent: [nil].
	mapWidth := (xmlParsed attributeAt: #width ifAbsent: [0]) asNumber .
	mapHeight := (xmlParsed attributeAt: #height ifAbsent: [0]) asNumber.
	tileWidth := (xmlParsed attributeAt: #tilewidth ifAbsent: [0]) asNumber.
	tileHeight := (xmlParsed attributeAt: #tileheight ifAbsent: [0]) asNumber.
	hexSideLength := (xmlParsed attributeAt: #hexsidelength ifAbsent: [0]) asNumber.
	staggerAxis := xmlParsed attributeAt: #staggeraxis ifAbsent: [nil].
	staggerIndex := xmlParsed attributeAt: #staggerindex ifAbsent: [nil].
	mapBackgroundColor := xmlParsed attributeAt: #backgroundcolor ifAbsent: [nil].
	nextlayerid := (xmlParsed attributeAt: #nextlayerid) asNumber.
	nextobjectid := (xmlParsed attributeAt: #nextobjectid) asNumber.
	
	mapOrientation ifNil: [ "Do nothing" ] ifNotNil: [ map propertiesAt: #orientation put: mapOrientation ].

	map
		propertiesAt: #width put: mapWidth;
		propertiesAt: #height put: mapHeight;
		propertiesAt: #tilewidth put: tileWidth;
		propertiesAt: #tileheight put: tileHeight.
		
	hexSideLength ifNil: [ "Do nothing, Only for hexagonal maps" ] ifNotNil: [ map propertiesAt: #hexsidelength put: hexSideLength ].
	staggerAxis ifNil: [ "Do nothing, For staggered and hexagonal maps" ] ifNotNil: [ map propertiesAt: #staggeraxis put: staggerAxis ].
	staggerIndex ifNil: [ "Do nothing, For staggered and hexagonal maps" ] ifNotNil: [ map propertiesAt: #staggerIndex put: staggerIndex ].
	mapBackgroundColor ifNil: [ "Do nothing" ] ifNotNil: [ map propertiesAt: #backgroundcolor put: mapBackgroundColor ].
	nextlayerid ifNil: [ "Do nothing, available since v 1.2" ] ifNotNil: [ map propertiesAt: #nextlayerid put: nextlayerid  ].
	nextobjectid ifNil: [ "Do nothing, available since v 0.11" ] ifNotNil: [ map propertiesAt: #nextobjectid put: nextobjectid  ].
	
	mapTileWidth := tileWidth.
	mapTileHeight := tileHeight.
	mapWidthInPixels := mapWidth * tileWidth.
	mapHeightInPixels := mapHeight * tileHeight.

	(mapOrientation notNil and: [ mapOrientation = 'staggered' and: [ mapHeight > 1 ] ])
		ifTrue: [ mapWidthInPixels := (mapWidthInPixels + tileWidth) / 2.
			mapHeightInPixels := (mapHeightInPixels / 2 + tileHeight) / 2 ]
		ifFalse: [ "Do nothing" ].

	(xmlParsed elementAt: #properties) ifNil: [ "Do nothing" ] ifNotNil: [ :properties | self loadProperties: properties in: map ].

	tileSets := xmlParsed descendantElementsNamed: #tileset.
	tileSets do: [ :tileSet | self loadTileSet: tileSet in: map ].

	layers := xmlParsed descendantElementsNamed: #layer.
	layers do: [ :layer | self loadLayer: layer in: map ].
	
	objectGroups := xmlParsed descendantElementsNamed: #objectgroup.
	objectGroups do: [ :objectGroup | self loadObjectGroup: objectGroup  in: map ].
	
	^ map
]

{ #category : #Evaluating }
WinterTiledMapLoader >> value [

	| textures map |
	
	textures := Dictionary new.
	self textureFiles
		do: [ :textureFile | textures at: textureFile path put: (WinterTexture from: textureFile) ].
	map := self tiledMap.
	map resources: textures.
	^ map
]
