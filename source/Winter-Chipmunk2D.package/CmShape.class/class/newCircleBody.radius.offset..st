instance creation
newCircleBody: aBody radius: radius offset: offsetPoint
	"Creates a circle shape (with a radius)"
	
	^ (self 
			primCpCircleShapeNew: aBody 
			radius: radius asFloat
			offset: offsetPoint asCmVector)
		initialize