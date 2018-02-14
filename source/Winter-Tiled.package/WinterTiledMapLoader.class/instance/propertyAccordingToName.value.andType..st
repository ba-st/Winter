Parsing - Layers
propertyAccordingToName: aName value: aValue andType: aType

	^ aType
		ifNil: [ aValue ]
		ifNotNil: [ aType = 'int'
				ifTrue: [ Integer readFrom: aValue ]
				ifFalse: [ aType = 'float'
						ifTrue: [ Float readFrom: aValue ]
						ifFalse: [ aType = 'bool'
								ifTrue: [ Boolean readFrom: aValue ]
								ifFalse: [ aType = 'color'
										ifTrue: [ 
											"Tiled uses the format #AARRGGBB"
											| r g b alpha |
											r := aValue copyFrom: 4 to: 5.
											g := aValue copyFrom: 6 to: 7.
											b := aValue copyFrom: 8 to: 9.
											alpha := aValue copyFrom: 2 to: 3.
											Color
												r: r
												g: g
												b: b
												alpha: alpha ]
										ifFalse: [ Error
												signal: ('Wrong type given for property <1s>, given : <2s>, supported : string, bool, int, float, color' expandMacrosWith: aName with: aType) ] ] ] ] ]