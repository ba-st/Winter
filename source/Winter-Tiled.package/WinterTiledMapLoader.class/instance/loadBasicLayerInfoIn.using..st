Parsing - Layers
loadBasicLayerInfoIn: aLayer using: aLayerElement

	| name opacity visible offsetX offsetY |
	
	name := aLayerElement attributeAt: #name ifAbsent: [ nil ].
	opacity := Float readFrom: (aLayerElement attributeAt: #opacity ifAbsent: [ '1.0' ]).
	visible := (aLayerElement attributeAt: #visible ifAbsent: [ 1 ]) = 1.
	offsetX := Float readFrom: (aLayerElement attributeAt: #offsetx ifAbsent: [ '0.0' ]).
	offsetY := Float readFrom: (aLayerElement attributeAt: #offsety ifAbsent: [ '0.0' ]).
	
	aLayer
		name: name;
		opacity: opacity;
		visible: visible;
		offsetX: offsetX;
		offsetY: offsetY