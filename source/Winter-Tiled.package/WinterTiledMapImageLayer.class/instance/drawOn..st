Drawing
drawOn: aCanvas

	| batchColor color vertices region x1 y1 x2 y2 u1 v1 u2 v2 |
	"By default is white"
	batchColor := Color white.
	
	"Should go in bits"
	color := Color
		r: batchColor r
		g: batchColor g
		b: batchColor b
		alpha: batchColor a * self opacity.

	vertices := Dictionary new.

	region := self textureRegion.

	region
		ifNil: [ "Do nothing" ]
		ifNotNil: [ 
			x1 := x * unitScale.
			y1 := y * unitScale.
			x2 := (x1 + region regionWidth) * unitScale.
			y2 := (y1 + region regionHeight) * unitScale.

			"	imageBounds.set(x1, y1, x2 - x1, y2 - y1);
		
		if (viewBounds.contains(imageBounds) || viewBounds.overlaps(imageBounds)) {"
			u1 := region u.
			v1 := region v.
			u2 := region u2.
			v2 := region v2.
			vertices at: #X1 put: x1.
			vertices at: #Y1 put: y1.
			vertices at: #C1 put: color.
			vertices at: #U1 put: u1.
			vertices at: #V1 put: v1.
			vertices at: #X2 put: x1.
			vertices at: #Y2 put: y2.
			vertices at: #C2 put: color.
			vertices at: #U2 put: u1.
			vertices at: #V2 put: v2.
			vertices at: #X3 put: x2.
			vertices at: #Y3 put: y2.
			vertices at: #C3 put: color.
			vertices at: #U3 put: u2.
			vertices at: #V3 put: v2.
			vertices at: #X4 put: x2.
			vertices at: #Y4 put: y1.
			vertices at: #C4 put: color.
			vertices at: #U4 put: u2.
			vertices at: #V4 put: v1

			"batch.draw(region.getTexture(), vertices, 0, NUM_VERTICES);}" ]