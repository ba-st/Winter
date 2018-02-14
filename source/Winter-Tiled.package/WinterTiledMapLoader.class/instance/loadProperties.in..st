private
loadProperties: aPropertiesElement in: aMapOrLayerOrMapObject

	aPropertiesElement
		ifNil: [ "Do nothing" ]
		ifNotNil: [ (aPropertiesElement attributeAt: #name) = 'properties'
				ifTrue: [ | properties |
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
				ifFalse: [ "Do nothing" ] ]