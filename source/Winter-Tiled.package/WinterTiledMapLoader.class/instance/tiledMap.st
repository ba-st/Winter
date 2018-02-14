Parsing
tiledMap

	| map tileSets layers mapOrientation mapWidth mapHeight tileWidth tileHeight hexSideLength staggerAxis staggerIndex  mapBackgroundColor  |

	map := WinterTiledMap new.
	mapOrientation := xmlParsed attributeAt: #orientation.
	mapWidth := xmlParsed attributeAt: #width.
	mapHeight := xmlParsed attributeAt: #height.
	tileWidth := xmlParsed attributeAt: #tilewidth.
	tileHeight := xmlParsed attributeAt: #tileheight.
	hexSideLength := xmlParsed attributeAt: #hexsidelength.
	staggerAxis := xmlParsed attributeAt: #staggeraxis.
	staggerIndex := xmlParsed attributeAt: #staggerindex.
	mapBackgroundColor := xmlParsed attributeAt: #backgroundcolor.

	mapOrientation ifNil: [ "Do nothing" ] ifNotNil: [ map propertiesAt: #orientation put: mapOrientation ].

	map
		propertiesAt: #width put: mapWidth;
		propertiesAt: #height put: mapHeight;
		propertiesAt: #tilewidth put: tileWidth;
		propertiesAt: #tileheight put: tileHeight;
		propertiesAt: #hexsidelength put: hexSideLength.

	staggerAxis ifNil: [ "Do nothing" ] ifNotNil: [ map propertiesAt: #staggeraxis put: staggerAxis ].
	staggerIndex ifNil: [ "Do nothing" ] ifNotNil: [ map propertiesAt: #staggerIndex put: staggerIndex ].
	mapBackgroundColor ifNil: [ "Do nothing" ] ifNotNil: [ map propertiesAt: #backgroundcolor put: mapBackgroundColor ].

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
	
	^ map