Evaluating
value: axisSymbol
	"Axis symbol should be #x , #X , #y or #Y"

	self assertIsAnAxisSymbol: axisSymbol.
	^ ((component position perform: axisSymbol asLowercase)
		> (game window perform: #playableExtent , axisSymbol asUppercase)
		or: [ (component position perform: axisSymbol asLowercase)
				< (game window perform: #position , axisSymbol asUppercase) ])
		ifTrue: [ game handleCollision: (CollisionAgainstMapBorders of: component) ]