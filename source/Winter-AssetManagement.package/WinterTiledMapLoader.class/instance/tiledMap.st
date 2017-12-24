Parsing
tiledMap
	| map tileSets layers |
	map := WinterTiledMap new.
	(xmlParsed elementAt: #properties)
		ifNil: [ "Do nothing" ]
		ifNotNil: [ :properties | self loadProperties: properties in: map ].
	tileSets := xmlParsed descendantElementsNamed: #tileset.
	tileSets
		do:
			[ :tileSet | tileSet descendantElementsNamed: #tile do: [ :tile | self loadTileSheet: tile in: map ] ].
	layers := (xmlParsed descendantElementsNamed: #layers)
		ifEmpty: [ xmlParsed ]
		ifNotEmpty: [ :element | element ].
	layers descendantElementsNamed: #layer do: [ :layer | self loadLayer: layer in: map ].
	^ map