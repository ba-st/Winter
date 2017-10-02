windows building
buildDampedRotarySpringPanelOn: aWindow
	| normalButton a morph a2 min max restAngle stiffness damping |
	
		normalButton := aWindow 
			newButtonFor: self
			getState: nil
			action: #newDampedRotarySpring:
			arguments: {#dampedRotarySpring}
			getEnabled: nil 
			label: 'Add'
			help: ' '.
	"restAngle:  restAngle 
		stiffness: stiffness 
		damping: damping."

	morph := aWindow newColumn:{
		aWindow newLabel: 'Slide Joint'.
		aWindow newRow:{
			aWindow newLabelGroup:{
				'RestAngle  1:'->(restAngle := aWindow newTextEditorFor: self getText: nil setText: nil).
				'Stiffness  1:'->(stiffness := aWindow newTextEditorFor: self getText: nil setText: nil).
				'damping'->(damping := aWindow newTextEditorFor: self getText: nil setText: nil).
			}.
			normalButton
		}}. 	
	
	morphPointers at: #dampedRotarySpring put: (OrderedCollection new 
		add: restAngle; 
		add: stiffness; 
		add: damping; 
		yourself).
	
	^morph	

