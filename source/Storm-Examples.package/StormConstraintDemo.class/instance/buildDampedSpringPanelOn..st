windows building
buildDampedSpringPanelOn: aWindow
	| normalButton a morph a2 min max restAngle stiffness damping |
	
		normalButton := aWindow 
			newButtonFor: self
			getState: nil
			action: #newDampedSpring:
			arguments: {#dampedSpring}
			getEnabled: nil 
			label: 'Add'
			help: ' '.
	"restAngle:  restAngle 
		stiffness: stiffness 
		damping: damping."

	morph := aWindow newColumn:{
		aWindow newLabel: 'Slide Joint'.
		aWindow newRow:{
				(a := self vectorMorphOn: aWindow title: 'Anchor 1' ).
				(a2 := self vectorMorphOn: aWindow title: 'Anchor 2' ).
				(restAngle := self floatMorphOn: aWindow title: 'RestAngle:' ).
				(stiffness := self floatMorphOn: aWindow title: 'Stiffness:' ).
				(damping := self floatMorphOn: aWindow title: 'damping:' ).
			normalButton
		}}. 	
	
	morphPointers at: #dampedSpring put: (OrderedCollection new 
		add: a;
		add: a2; 
		add: restAngle; 
		add: stiffness; 
		add: damping; 
		yourself).
	
	^morph	

