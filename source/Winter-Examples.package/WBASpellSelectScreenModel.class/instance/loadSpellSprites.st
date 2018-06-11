Screen Building
loadSpellSprites
	^ (1 to: 6) collect: [ :i |
		WBASpellDescriptor new
			fileName: 'spell' , i printString;
			loadExplodeSpritesWith: screen surface ]