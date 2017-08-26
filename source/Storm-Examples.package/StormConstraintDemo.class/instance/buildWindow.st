accessing
buildWindow
	| newWindow normalButton |
	
	newWindow := (StandardWindow labelled: self title)
		extent: self dimensions + (900@100);
		yourself.
		
	normalButton := newWindow 
			newButtonFor: newWindow 
			action: #drawNormalToggle 
			label: 'drawNormal' 
			help: 'helpText'.
		
	newWindow addMorph: (newWindow newRow: {
			"row 1"
			(surfaceContainer := (ImageMorph new
			image: (Form extent: self dimensions depth: 32))).
			"row 2 "
			newWindow newColumn: {
			self buildPinJointPanelOn: newWindow.
			self buildPivotJointPanelOn: newWindow.
			self buildSlideJointPanelOn: newWindow.
			"self buildDampedRotarySpringPanelOn: newWindow."
			"self buildSlideJointPanelOn: newWindow."
			
			
			
			
			}})
		
			
			
			
		fullFrame: (LayoutFrame 
				fractions: (0@0 corner: 1@1) 
				offsets: (0@0 corner: 0@0)).
	
				
		
		
			
			
		
				
	newWindow announcer 
		on: WindowClosed do: [ self stop. window := nil ].
		
	^newWindow
		