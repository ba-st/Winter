Parsing - Layers
loadTileGroup: aLayerElement in: aMap

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