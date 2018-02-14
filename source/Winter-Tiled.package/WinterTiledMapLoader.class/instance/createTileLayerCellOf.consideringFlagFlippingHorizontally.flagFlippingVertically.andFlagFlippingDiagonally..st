Parsing - Layers
createTileLayerCellOf: aTile consideringFlagFlippingHorizontally: aFlipHorizontallyFlag flagFlippingVertically: aFlipVerticallyFlag andFlagFlippingDiagonally: aFlipDiagonallyFlag
	
	| horizontally vertically rotation |
	
	aFlipDiagonallyFlag
		ifTrue: [ vertically := true.
			rotation := WinterTiledMapTileLayerCell rotate270.
			aFlipHorizontallyFlag
				ifTrue: [ horizontally := true.
					vertically := false ].
			aFlipVerticallyFlag
				ifTrue: [ vertically := true.
					rotation := WinterTiledMapTileLayerCell rotate90 ] ]
		ifFalse: [ vertically := aFlipVerticallyFlag.
			horizontally := aFlipHorizontallyFlag.
			rotation := WinterTiledMapTileLayerCell rotate0 ].
	^ WinterTiledMapTileLayerCell
		of: aTile
		flippingHorizontally: horizontally
		flippingVertically: vertically
		rotating: rotation