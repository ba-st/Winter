Parsing
loadProperties: aPropertiesElement in: aMap
	aPropertiesElement name = #Properties
		ifTrue: [ aPropertiesElement
				descendantElementsNamed: #Property
				do: [ :property | 
					| key value type |
					key := property attributeAt: #Key.
					type := property attributeAt: #Type.
					value := property contentString.
					type = #Int32
						ifTrue: [ aMap propertiesAt: key put: (Integer readFrom: value) ].
					type = #Boolean
						ifTrue: [ aMap propertiesAt: key put: (value sameAs: 'true') ]
						ifFalse: [ aMap propertiesAt: key put: value ] ] ]