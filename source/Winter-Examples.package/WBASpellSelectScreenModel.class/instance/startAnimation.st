animations
startAnimation
	self every10GameTickDo: [
		spellWidgets first widgets do: [ :toggleSp | 
				toggleSp toggle ] ] 