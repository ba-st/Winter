accessing
addComponents: aCollection
	aCollection do: [ :each | self addComponent: each ]