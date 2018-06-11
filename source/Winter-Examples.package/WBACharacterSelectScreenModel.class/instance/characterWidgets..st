Screen Building
characterWidgets: cood
	^ (1 to: 13) collect: [ :i |
			| sprites |
			sprites := WBACharacterDescriptor new
				fileName: 'perso' , i printString;
				position: cood;
				loadShortSpritesWith: screen surface .
			self newAnimatedWidget: sprites ]