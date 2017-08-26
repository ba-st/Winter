evaluating
evaluate
	self initializeAttributeBindings.
	self compile.
	
	self drawWindow openWith: self drawPainter.