Bootstrap
loadAllText

	self class availableText do: [ :key |
		fileName := key asString.
		self loadImageFile ].
