button action 
newPivot: aSymbol

	| col a a2 ax ay a2x a2y body1 body2 constraint space |
	
	" can be more pretty but we need to be fast in the second part of the method store every required data then access it in temp ( faster ) "
	a := ((morphPointers at: aSymbol) first contents subStrings: '@').
	ax := a first asInteger asFloat.
	ay := a second asInteger asFloat.
	space := self currentScene physicSpace.		
	" Here we should be fast that the engine do not have time to change the stuff "
	body1 := self createBodyOne.
	body2 := self createBodyTwo.
	constraint := CmExternalConstraint 
		newPivotJoint: body1 
		with: body2 
		joinedTo: (CmVector x: ax y: ay).
	space addConstraint: constraint.
	self currentScene addComponent:  (StormPivotJointComponent for: constraint).
		
	