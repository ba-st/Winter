Bootstrap
basicLoadImageFile

	^ WinterAssetManagementSystem current
		addSprite:
			('<1s>/<2s>/<3s>.png'
				expandMacrosWith: self resourceFolder
				with: self classFolder
				with: fileName)
		named: fileName