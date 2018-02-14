Parsing - Layers
loadLayer: aLayerElement in: aMap

	| name |

	name := aLayerElement attributeAt: #name.
	name = 'group'
		ifTrue: [ self loadTileGroup: aLayerElement in: aMap ].
	name = 'layer'
		ifTrue: [ self loadTileLayer: aLayerElement in: aMap ].
	name = 'objectgroup'
		ifTrue: [ self loadObjectGroup: aLayerElement in: aMap ].
	name = 'imagelayer'
		ifTrue: [ self loadImageLayer: aLayerElement in: aMap ]