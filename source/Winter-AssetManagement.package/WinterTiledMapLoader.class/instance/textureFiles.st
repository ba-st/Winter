Parsing
textureFiles
	| images tileSetsElement |
	images := OrderedCollection new.
	tileSetsElement := (xmlParsed descendantElementsNamed: #tileset) .
	images := tileSetsElement
		collect: [ :tileSet | 
			| imageSource |
			imageSource := (tileSet descendantElementsNamed: #image) anyOne.
			self imageFrom: (imageSource  attributeAt: #source) ].
	^ images