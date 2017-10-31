Evaluating
value: axisSymbol
	"Axis symbol should be #x , #X , #y or #Y"

	self assertIsAnAxisSymbol: axisSymbol.
	((component position perform: axisSymbol asLowercase asSymbol)
		> (game window perform: (#playableExtent , axisSymbol asUppercase) asSymbol)
		or: [ (component position perform: axisSymbol asLowercase asSymbol)
				< (game window perform: (#position , axisSymbol asUppercase) asSymbol) ])
		ifTrue: [ 
		
			game handleCollision: (CollisionAgainstMapBorders of: component on: axisSymbol) ]