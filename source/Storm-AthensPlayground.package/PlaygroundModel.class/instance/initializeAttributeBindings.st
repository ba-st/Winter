initialize
initializeAttributeBindings
	attributeBindings := Dictionary new 
		at: 'window' put: AthensWindow new; 
		at: 'draw' put: AthensPainter new;
		yourself