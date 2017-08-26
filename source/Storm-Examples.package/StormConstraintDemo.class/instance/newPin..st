button action 
newPin: aSymbol

	| col a a2 ax ay a2x a2y body1 body2 constraint space |
	
	" can be more pretty but we need to be fast in the second part of the method store every required data then access it in temp ( faster ) "
	a := ((morphPointers at: aSymbol) first contents string subStrings: '@').
	a2 := ((morphPointers at: aSymbol) second contents string subStrings: '@').
	ax := a first asInteger asFloat.
	ay := a second asInteger asFloat.
	a2x := a2 first asInteger asFloat.
	a2y := a2 second asInteger asFloat.
	space := self currentScene physicSpace.		
		
	" Here we should be fast that the engine do not have time to change the stuff "
	body1 := self createBodyOne.
	body2 := self createBodyTwo.
	constraint := CmExternalConstraint newPinJoint: body1 
			with: body2
			anchor:  (CmVector x: ax y: ay) 
			andAnchor2:  (CmVector x: a2x y: a2y).
	space addConstraint: constraint.
	self currentScene addComponent:  (StormPinJointComponent for: constraint).
		
	