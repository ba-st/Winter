Parsing
tiledMap

	| map mapOrientation mapWidth mapHeight tileWidth tileHeight hexSideHeight stagerAxis stagerIndex mapBackgroundColor tileSets  mapTileWidth mapTileHeight mapWidthInPixels mapHeightInPixels |
	"Big refactor needed"
	map := WinterTiledMap new.
	mapOrientation := xmlParsed attributeAt: #orientation ifAbsent: [ nil ].
	mapWidth := xmlParsed attributeAt: #width ifAbsent: [ 0 ].
	mapHeight := xmlParsed attributeAt: #height ifAbsent: [ 0 ].
	tileWidth := xmlParsed attributeAt: #tileWidth ifAbsent: [ 0 ].
	tileHeight := xmlParsed attributeAt: #tileHeight ifAbsent: [ 0 ].
	hexSideHeight := xmlParsed attributeAt: #hexsideheight ifAbsent: [ 0 ].
	stagerAxis := xmlParsed attributeAt: #stageraxis ifAbsent: [ nil ].
	stagerIndex := xmlParsed attributeAt: #stagerindex ifAbsent: [ nil ].
	mapBackgroundColor := xmlParsed attributeAt: #backgroundcolor ifAbsent: [ nil ].
	mapOrientation ifNotNil: [ map propertiesAt: #orientation put: mapOrientation ].
	map
		propertiesAt: #width put: mapWidth;
		propertiesAt: #height put: mapHeight;
		propertiesAt: #tilewidth put: tileWidth;
		propertiesAt: #tileheight put: tileHeight;
		propertiesAt: #hexsideheight put: hexSideHeight.
	stagerAxis ifNotNil: [ map propertiesAt: #stageraxis put: stagerAxis ].
	stagerIndex ifNotNil: [ map propertiesAt: #stagerindex put: stagerIndex ].
	mapBackgroundColor
		ifNotNil: [ map propertiesAt: #backgroundcolor put: mapBackgroundColor ].
	mapTileWidth := tileWidth.
	mapTileHeight := tileHeight.
	mapWidthInPixels := mapWidth * tileWidth.
	mapHeightInPixels := mapHeight * tileHeight.
	(mapOrientation notNil and: [ mapOrientation = 'staggered' and: [ mapHeight > 1 ] ])
		ifTrue: [ mapWidthInPixels := mapWidthInPixels + (tileWidth / 2).
			(mapHeightInPixels = (mapHeightInPixels / 2)) + (tileHeight / 2) ].
	(xmlParsed elementAt: #properties)
		ifNil: [ "Do nothing" ]
		ifNotNil: [ :properties | self loadProperties: properties in: map ].
	tileSets := xmlParsed descendantElementsNamed: #tileset.
	tileSets
		do: [ :tileSet | 
			self loadTileSheet: tileSet in: map.
			xmlParsed removeNode: tileSet ifAbsent: [ "Do nothing" ] ].
	xmlParsed descendantElements do: [ :element | self loadLayer: element in: map ].
	^ map