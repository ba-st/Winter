Parsing
textureFiles

	| images tileSetsElement |
	"Refactor urgente"
	images := OrderedCollection new.
	tileSetsElement := xmlParsed descendantElementsNamed: #tileset.
	tileSetsElement
		do: [ :tileSet | 
			| source newTileSet imageElement image imageSource |
			source := tileSet attributeAt: #source ifAbsent: [ nil ].
			source
				ifNil: [ (tileSet descendantElementsNamed: #tile)
						do: [ :tile | 
							imageSource := (tile elementAt: #image) attributeAt: #source.
							image := self imageFrom: imageSource.
							images add: image ] ]
				ifNotNil: [ newTileSet := XMLDOMParser parseFileNamed: source.
					imageElement := newTileSet elementAt: #image.
					imageElement
						ifNil: [ newTileSet
								descendantElementsNamed: #tile
								do: [ :tile | 
									imageSource := (tile elementAt: #image) attributeAt: #source.
									image := self imageFrom: imageSource.
									images add: image ] ]
						ifNotNil: [ imageSource := imageElement attributeAt: #source.
							image := self imageFrom: imageSource.
							images add: image ] ] ].
	^ images