as yet unclassified
isAnimationSplit: x 

	"if x is 8, answers true every 8th of operation"
	^ actualStep  \\ (self numberOfAnimationFrame // x) = 0