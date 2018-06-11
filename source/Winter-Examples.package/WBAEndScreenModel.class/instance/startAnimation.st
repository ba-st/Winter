animations
startAnimation
	self every10GameTickDo: [ 
		characterWidget toggle.
		spellWidget toggle ] 