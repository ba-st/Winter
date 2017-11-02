Evaluating
value

	| textures map |
	textures := self textureFiles collect: [ :textureFile | WinterTexture from: textureFile ].
	map := self tiledMap.
	map resources: textures.
	^ map