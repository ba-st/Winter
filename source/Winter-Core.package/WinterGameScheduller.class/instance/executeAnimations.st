initialization
executeAnimations
	^ gameStepActions
		keysAndValuesDo: [ :element :animation | animation animate ]