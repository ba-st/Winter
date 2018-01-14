Evaluating
value
	| textures map |
	textures := Dictionary new.
	self textureFiles
		do: [ :textureFile | textures at: textureFile path put: (WinterTexture from: textureFile) ].
	map := self tiledMap.
	map resources: textures values.
	^ map