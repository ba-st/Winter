windows building
buildPivotJointPanelOn: aWindow
	| normalButton a a2 morph v |
	
		normalButton := aWindow 
			newButtonFor: self
			getState: nil 
			action: #newPivot:
			arguments: {#pivot}
			getEnabled: nil 
			label: 'Add'
			help: ' '.
	
	morph := aWindow newColumn:{
		aWindow newLabel: 'Pivot Joint Constraint'.
		aWindow newRow:{
				(a :=self vectorMorphOn: aWindow title: 'Anchor').
			normalButton
		}}. 	
	" Go #$%#@ yourself Demeter ! "	
	" first draft to return the value from the interface "
	" should create a object but I do not have time to do "

	v := a contentMorph submorphs first submorphs third. 
	morphPointers at: #pivot put: (OrderedCollection new add: v; yourself).
	
	^morph	

