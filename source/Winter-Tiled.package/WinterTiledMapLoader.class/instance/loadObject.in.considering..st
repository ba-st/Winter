Parsing - Layers
loadObject: anObjectElement in: aLayer considering: aMap

	| scaleX scaleY x y width height points vertices point polyline polygon gid id flipHorizontally flipVertically tile rotation type properties tiledMapTileMapObject textureRegion objectWidth objectHeight |
	
	(anObjectElement attributeAt: #name) = 'object'
		ifTrue: [ 
			| object |
			
			object := nil.
			"Consider this later: convertObjectToTileSpace ? 1.0f / mapTileWidth : 1.0f"
			scaleX := 1.0.
			"Consider this later: convertObjectToTileSpace ? 1.0f / mapTileHeight : 1.0f"
			scaleY := 1.0.
			x := (anObjectElement attributeAt: #x ifAbsent: [ 0 ]) asFloat
				* scaleX.

			"Consider this later: (flipY ? (heightInPixels - element.getFloatAttribute('y', 0)) : element.getFloatAttribute('y', 0)) * scaleY"
			y := (anObjectElement attributeAt: #y ifAbsent: [ 0 ]) asFloat
				* scaleY.
			width := (anObjectElement attributeAt: #width ifAbsent: [ 0 ])
				asFloat * scaleX.
			height := (anObjectElement attributeAt: #height ifAbsent: [ 0 ])
				asFloat * scaleY.
			anObjectElement hasChildren
				ifTrue: [ 
					| child |
					
					child := anObjectElement elementAt: #polygon.
					child
						ifNil: [ child := anObjectElement elementAt: #polyline.
							child
								ifNil: [ child := anObjectElement elementAt: #ellipse.
									child
										ifNil: [ "Do nothing" ]
										ifNotNil: [ "Consider this later: flipY ? y - height : y"
											object := WinterEllipseMapObject
												of:
													(EllipseMorph new
														position: x @ y;
														extent: width @ height;yourself ) ] ]
								ifNotNil: [ 
									points := (child attributeAt: #points) substrings.
									vertices := Array new: points size * 2.
									(1 to: points size)
										do: [ :index | 
											point := points substrings: ','.
											vertices
												at: index * 2
												put: (Float readFrom: (point at: 1)) * scaleX.
											"Consider for later: (flipY ? -1 : 1)"
											vertices
												at: index * 2 + 1
												put: (Float readFrom: (point at: 2)) * scaleY * 1 ].
									polyline := LineSegment controlPoints: vertices.
									object := WinterPolylineMapObject of: polyline atX: x andY: y ] ]
						ifNotNil: [ 
							points := (child attributeAt: #points) substrings.
							vertices := Array new: points size * 2.
							(1 to: points size)
								do: [ :index | 
									point := points substrings: ','.
									vertices
										at: index * 2
										put: (Float readFrom: (point at: 1)) * scaleX.
									"Consider for later: (flipY ? -1 : 1)"
									vertices
										at: index * 2 + 1
										put: (Float readFrom: (point at: 2)) * scaleY * 1 ].
							polygon := Polygon vertices: vertices.
							object := WinterPolygonMapObject of: polygon atX: x andY: y ] ]
				ifFalse: [ "Do nothing" ].
			object
				ifNil: [ 
					gid := anObjectElement attributeAt: #gid ifAbsent: [ nil ].
					gid
						ifNil:
							[ "object = new RectangleMapObject(x, flipY ? y - height : y, width, height);" ]
						ifNotNil: [ id := Integer readFrom: gid.
							flipHorizontally := (id & FlagFlipHorizontally) ~= 0.
							flipVertically := (id & FlagFlipVertically) ~= 0.
							tile := aMap tilesAt: id & MaskClear not.
							tiledMapTileMapObject := WinterTiledMapTileMapObject
								from: tile
								horizontally: flipHorizontally
								vertically: flipVertically.
							textureRegion := tiledMapTileMapObject textureRegion.
							tiledMapTileMapObject propertiesAt: 'gid' put: id.
							tiledMapTileMapObject x: x.
							"Consider later: (flipY ? y : y - height)"
							tiledMapTileMapObject y: y.
							objectWidth := Float
								readFrom:
									(anObjectElement
										attributeAt: #width
										ifAbsent: [ textureRegion regionWidth ]).
							objectHeight := Float
								readFrom:
									(anObjectElement
										attributeAt: #height
										ifAbsent: [ textureRegion regionHeight ]).
							tiledMapTileMapObject
								scaleX: scaleX * (objectWidth / textureRegion regionWidth).
							tiledMapTileMapObject
								scaleY: scaleY * (objectHeight / textureRegion regionHeight).
							tiledMapTileMapObject
								rotation:
									(Float
										readFrom: (anObjectElement attributeAt: #rotation ifAbsent: [ 0 ])).
							object := tiledMapTileMapObject ] ]
				ifNotNil: [ "Do nothing" ].
			object name: (anObjectElement attributeAt: #name ifAbsent: [ nil ]).
			rotation := anObjectElement attributeAt: #rotation ifAbsent: [ nil ].
			rotation
				ifNil: [ "Do nothing" ]
				ifNotNil: [ object propertiesAt: 'rotation' put: (Float readFrom: rotation) ].
			type := anObjectElement attributeAt: #type ifAbsent: [ nil ].
			type
				ifNil: [ "Do nothing" ]
				ifNotNil: [ object propertiesAt: 'type' put: type ].
			id := anObjectElement attributeAt: #id ifAbsent: [ 0 ].
			id isZero
				ifTrue: [ "Do nothing" ]
				ifFalse: [ object propertiesAt: 'id' put: id ].
			object propertiesAt: #x put: x.

			"Consider this later for WinterTiledMapTileMapObject: flipY ? y - height : y"
			object propertiesAt: #y put: y.
			object propertiesAt: #width put: width.
			object propertiesAt: #height put: height.
			object
				visible: (anObjectElement attributeAt: #visible ifAbsent: [ 1 ]) = 1.
			properties := anObjectElement elementAt: #properties.
			properties
				ifNil: [ "Do nothing" ]
				ifNotNil: [ self loadProperties: properties in: object ].
			aLayer addObject: object ]
		ifFalse: [ "Do nothing" ]