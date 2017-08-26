accessing
addComponent: aComponent
	aComponent scene: self.
	components := components copyWith: aComponent.