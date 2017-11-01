Managing
removeComponent: aComponent

	aComponent scene: nil.
	components := components copyWithout:  aComponent.
	
