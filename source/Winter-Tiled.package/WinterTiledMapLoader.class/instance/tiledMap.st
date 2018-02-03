Parsing
tiledMap

	| map tileSets layers |

	map := WinterTiledMap new.

	(xmlParsed elementAt: #properties) ifNil: [ "Do nothing" ] ifNotNil: [ :properties | self loadProperties: properties in: map ].

	tileSets := xmlParsed descendantElementsNamed: #tileset.
	tileSets do: [ :tileSet | self loadTileSet: tileSet in: map ].

	layers := xmlParsed descendantElementsNamed: #layer.
	layers do: [ :layer | self loadLayer: layer in: map ].

	^ map