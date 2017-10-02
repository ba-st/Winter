windows building
vectorMorphOn: aWindow title: Astring
	| normalButton a morph a2 min max id addxButton object minusxButton minusyButton addyButton p g add5xButton minus5xButton minus5yButton add5yButton |
	g := GroupboxMorph new.
	g label:  Astring.
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
				
		add5xButton := aWindow 
			newButtonFor: p
			getState: nil
			action: #add5x
			arguments: {}
			getEnabled: nil 
			label: 'X +5'
			help: ' '.
	
		minus5xButton := aWindow 
			newButtonFor: p
			getState: nil
			action: #sub5x
			arguments: {}
			getEnabled: nil 
			label: 'X -5'
			help: ''.
			
		minus5yButton := aWindow 
			newButtonFor: p
			getState: nil
			action: #sub5y
			arguments: { }
			getEnabled: nil 
			label: 'Y -5'
			help: ''.
			
		add5yButton := aWindow 
			newButtonFor: p
			getState: nil
			action: #add5y
			arguments: {}
			getEnabled: nil 
			label: 'Y +5'
			help: ''.	
		
	
	morph := aWindow newRow:{
			aWindow newColumn:{
				add5xButton.
				minus5xButton}.
			aWindow newColumn:{
				addxButton.
				minusxButton}.
				p asMorph.
			aWindow newColumn:{
				addyButton.
				minusyButton}.
			aWindow newColumn:{
				add5yButton.
				minus5yButton}}.
				
		g addContentMorph:morph.
		^g
		
	