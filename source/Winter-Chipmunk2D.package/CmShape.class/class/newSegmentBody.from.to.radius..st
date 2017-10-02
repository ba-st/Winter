instance creation
newSegmentBody: aBody from: fromPoint to: toPoint radius: aFloat
	"Creates a segment shape from a point to another"
	
	^ (self 
			primCpSegmentNew: aBody
			from: fromPoint asCmVector
			to: toPoint asCmVector
			radius: aFloat asFloat)
		initialize