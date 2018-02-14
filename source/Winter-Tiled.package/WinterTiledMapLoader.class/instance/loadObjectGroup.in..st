Parsing - Layers
loadObjectGroup: aLayerElement in: aMap

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