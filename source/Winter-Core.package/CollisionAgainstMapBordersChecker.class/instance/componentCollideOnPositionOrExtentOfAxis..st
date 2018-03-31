private
componentCollideOnPositionOrExtentOfAxis: axisSymbol
	^ (component position perform: axisSymbol asLowercase asSymbol)
		>
			(game window
				perform: (#extent , axisSymbol asUppercase) asSymbol)
		or: [ (component position perform: axisSymbol asLowercase asSymbol)
				< (game window perform: (#position , axisSymbol asUppercase) asSymbol) ]