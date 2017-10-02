windows building
buildPinJointPanelOn: aWindow
	| normalButton a a2 morph v v2 |
	
		normalButton := aWindow 
			newButtonFor: self
			getState: nil
			action: #newPin:
			arguments: {#pin}
			getEnabled: nil 
			label: 'Add'
			help: ' '.
	
	morph := aWindow newColumn:{
		aWindow newLabel: 'Pin Joint Constraint'.
		aWindow newRow:{
				(a :=self vectorMorphOn: aWindow title: 'Anchor').
				(a2 :=self vectorMorphOn: aWindow title: 'Anchor 2').
		
			normalButton
		}}. 	
		
	
	v := a contentMorph submorphs first submorphs third. 
	v2 := a2 contentMorph submorphs first submorphs third. 
	morphPointers at: #pin put: (OrderedCollection new add: v; add: v2;yourself).
	
	^morph	

