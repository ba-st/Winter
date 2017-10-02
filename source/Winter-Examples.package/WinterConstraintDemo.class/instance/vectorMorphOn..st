windows building
vectorMorphOn: aWindow
	| normalButton a morph a2 min max id addxButton object minusxButton minusyButton addyButton p g |
	g := GroupboxMorph new.
	
	p := VectorDemoModel new.
	
		addxButton := aWindow 
			newButtonFor: p
			getState: nil
			action: #addx
			arguments: {}
			getEnabled: nil 
			label: 'X +'
			help: ' '.
	
		minusxButton := aWindow 
			newButtonFor: p
			getState: nil
			action: #subx
			arguments: {}
			getEnabled: nil 
			label: 'X -'
			help: ''.
			
		minusyButton := aWindow 
			newButtonFor: p
			getState: nil
			action: #suby
			arguments: { }
			getEnabled: nil 
			label: 'Y -'
			help: ''.
			
		addyButton := aWindow 
			newButtonFor: p
			getState: nil
			action: #addy
			arguments: {}
			getEnabled: nil 
			label: 'Y +'
			help: ''.	
		
	
	morph := aWindow newRow:{
			aWindow newColumn:{
				addxButton.
				minusxButton}.
				p asMorph.
			aWindow newColumn:{
				addyButton.
				minusyButton}}.
				
		g addContentMorph:morph.
		^g
		
	