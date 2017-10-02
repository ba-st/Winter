windows building
floatMorphOn: aWindow title: Astring
	| normalButton a morph a2 min max id addxButton object minusxButton minusyButton addyButton p g add5xButton minus5xButton minus5yButton add5yButton |
	g := GroupboxMorph new.
	g label:  Astring.
	p := aWindow newTextEditorFor: self getText: nil setText: nil.
	
		
		
	
	morph :=p.
			
				
		g addContentMorph:morph.
		^g
		
	