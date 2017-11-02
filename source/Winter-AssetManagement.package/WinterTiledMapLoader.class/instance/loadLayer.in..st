Parsing
loadLayer: aLayerElement in: aMap

	| elementName |
	elementName := aLayerElement name.
	elementName = 'group'
		ifTrue: [ self loadTiledGroup: aLayerElement in: aMap ].
	elementName = 'layer'
		ifTrue: [ self loadTiledLayer: aLayerElement in: aMap ].
	elementName = 'objectgroup'
		ifTrue: [ self loadObjectGroup: aLayerElement in: aMap ].
	elementName = 'imagelayer'
		ifTrue: [ self loadImageLayer: aLayerElement in: aMap ]