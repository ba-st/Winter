button action 
newDampedRotarySpring: aSymbol

	
	" can be more pretty but we need to be fast in the second part of the method store every required data then access it in temp ( faster ) "

	| restAngle stiffness damping space body1 body2 constraint |
	restAngle :=  ((morphPointers at: aSymbol) first text string  asInteger asFloat).
	stiffness :=  ((morphPointers at: aSymbol) second text string  asInteger asFloat).
	damping :=  ((morphPointers at: aSymbol) third text string  asInteger asFloat).
	space := self currentScene physicSpace.		
		
	" Here we should be fast that the engine do not have time to change the stuff "
	body1 := self createBodyOne.
	body2 := self createBodyTwo.
	constraint := CmExternalConstraint  newDampedRotarySpring: body1 
		with: body2 
		restAngle:  restAngle 
		stiffness: stiffness 
		damping: damping.

	space addConstraint: constraint.
	self currentScene addComponent:  (StormDampedRotarySpringComponent for: constraint withA: body1 andB:  body2 ).
		
	