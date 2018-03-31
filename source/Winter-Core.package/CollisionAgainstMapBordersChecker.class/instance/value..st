Evaluating
value: axisSymbol
	"Axis symbol should be #x , #X , #y or #Y"

	self assertIsAnAxisSymbol: axisSymbol.
	(self componentCollideOnPositionOrExtentOfAxis: axisSymbol)
		ifTrue: [ (CollisionAgainstMapBorders of: component on: axisSymbol)
				applyOnGame ]