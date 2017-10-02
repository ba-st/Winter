windows building
buildSlideJointPanelOn: aWindow
	| normalButton a morph a2 min max |
	
		normalButton := aWindow 
			newButtonFor: self
			getState: nil
			action: #newSlide:
			arguments: {#slide}
			getEnabled: nil 
			label: 'Add'
			help: ' '.
	
	morph := aWindow newColumn:{
		aWindow newLabel: 'Slide Joint'.
		aWindow newRow:{
				(a :=self vectorMorphOn: aWindow title: 'Anchor 1').
				(a2 :=self vectorMorphOn: aWindow title: 'Anchor 2').
				(min := self floatMorphOn: aWindow title: 'Min').
				(max := self floatMorphOn: aWindow title: 'Max').
		
			normalButton
		}}. 	
	
	
	morphPointers at: #slide put: (OrderedCollection new 
		add: a contentMorph submorphs first submorphs third; 
		add: a2 contentMorph submorphs first submorphs third;
		add: min contentMorph submorphs first; 
		add: max contentMorph submorphs first; 
		yourself).
	
	^morph	
