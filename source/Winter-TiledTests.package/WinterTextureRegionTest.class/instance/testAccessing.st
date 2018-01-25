Tests
testAccessing

	| texture textureRegion |

	texture := WinterTexture from: 'pharo.png' asFileReference.
	textureRegion := WinterTextureRegion of: texture.

	self
		assert: textureRegion texture equals: texture;
		assert: textureRegion regionHeight equals: texture height;
		assert: textureRegion regionWidth equals: texture width;
		assert: textureRegion u equals: 0.0;
		assert: textureRegion u2 equals: 1.0;
		assert: textureRegion v equals: 0.0;
		assert: textureRegion v2 equals: 1.0;
		assert: textureRegion regionX equals: (textureRegion u * texture width);
		assert: textureRegion regionY equals: (textureRegion v * texture height ).
		
	textureRegion texture: nil.
	self
		assert: textureRegion texture equals: nil.
		
	textureRegion texture: texture .
	textureRegion regionHeight: 2.
	textureRegion regionWidth: 2.
	self assert: textureRegion regionHeight equals: 2.0;
		assert: textureRegion regionWidth equals: 2.0;
		assert: textureRegion u equals: 0.0;
		assert: textureRegion v equals: 0.0.
		
textureRegion regionX: 2.
	textureRegion regionY: 2.
	self assert: textureRegion regionX equals: 2.0;
		assert: textureRegion regionY equals: 2.0;
		assert: textureRegion u equals: 2/ texture width asFloat ;
		assert: textureRegion v equals: 2/ texture width asFloat .
		
	textureRegion u: 0.5.
	textureRegion v: 0.5.
	self assert: textureRegion regionWidth  equals: ((textureRegion u2 - 0.5) abs * texture width);
		assert: textureRegion regionHeight  equals: ((textureRegion v2 - 0.5) abs * texture height );
		assert: textureRegion u equals: 0.5;
		assert: textureRegion v equals: 0.5.
		
	textureRegion u2: 0.5.
	textureRegion v2: 0.5.
	self assert: textureRegion regionWidth  equals: 0.0;
		assert: textureRegion regionHeight  equals: 0.0;
		assert: textureRegion u2 equals: 0.5;
		assert: textureRegion v2 equals: 0.5.
	