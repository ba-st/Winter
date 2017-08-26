basic operation
rotateBy: aCmVector
	"rotate self by aCmVector "
	^ CmVector
		x: ((self x * aCmVector x) - (self y * aCmVector y))
		y: ((self x * aCmVector y) + (self y * aCmVector x)).
