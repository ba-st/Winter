private
componentCollideOnPositionOrExtentOfAxis: axisSymbol
	^ (component position perform: axisSymbol asLowercase asSymbol)
		>
			(game screen
				perform: (#extent , axisSymbol asUppercase) asSymbol)
		or: [ (component position perform: axisSymbol asLowercase asSymbol)
				< (game screen perform: (#position , axisSymbol asUppercase) asSymbol) ]