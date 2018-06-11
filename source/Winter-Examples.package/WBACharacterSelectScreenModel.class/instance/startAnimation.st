rendering
startAnimation
	self every10GameTickDo: [
		characterWidget widgets do: [ :w |
			w widgets do: [ :toggleSp |
				toggleSp toggle ] ] ] 