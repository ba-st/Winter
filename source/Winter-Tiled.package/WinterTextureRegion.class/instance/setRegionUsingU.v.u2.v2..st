initialization
setRegionUsingU: aPartialUValue v: aPartialVValue u2: aPartialU2Value v2: aPartialV2Value

	| partialU partialU2 partialV partialV2 |

	partialU := aPartialUValue.
	partialU2 := aPartialU2Value.
	partialV := aPartialVValue .
	partialV2 := aPartialV2Value.

	regionWidth := (aPartialU2Value - aPartialUValue) abs * texture width roundTo: 0.1.
	regionHeight := (aPartialV2Value - aPartialVValue) abs * texture height roundTo: 0.1.

	"For a 1x1 region, adjust UVs toward pixel center to avoid filtering artifacts on AMD GPUs when drawing very stretched"
	(regionHeight = 1 and: [ regionWidth = 1 ])
		ifTrue: [ 
			| adjustedX adjustedY |
			
			adjustedX := 0.25 / texture width.
			partialU := partialU + adjustedX.
			partialU2 := partialU2 - adjustedX.
			
			adjustedY := 0.25 / texture height.
			partialV := partialV + adjustedY.
			partialV2 := partialV2 - adjustedY ].
		
	u := partialU.
	u2 := partialU2.
	v := partialV.
	v2 := partialV2