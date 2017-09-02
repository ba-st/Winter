initialization
initializeWidgets 
	self instantiateModels: #(
		startButton ButtonModel
		playground #PlaygroundModel).
	
	playground aboutToStyle: true.
	startButton 
		label: 'Go!';
		action: [ 
			playground 
				accept;
				evaluate ].
	