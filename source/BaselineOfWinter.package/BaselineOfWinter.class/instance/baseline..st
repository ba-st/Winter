baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ self setUpDependenciesFor: spec.
			spec
				package: 'Winter-AssetManagement' with: [ spec requires: #('PharoSound') ];
				package: 'Winter-AssetManagementTests' with: [ spec requires: #('Winter-AssetManagement') ];
				package: 'Winter-Core' with: [ spec requires: #('Winter-AssetManagement') ];
				package: 'Winter-CoreTests' with: [ spec requires: #('Winter-Core') ];
				package: 'Winter-Chipmunk2D' with: [ spec requires: #('Winter-Core') ];
				package: 'Winter-Chipmunk2DTests' with: [ spec requires: #('Winter-Chipmunk2D') ];
				package: 'Winter-Morphic' with: [ spec requires: #('Winter-Chipmunk2D') ];
				package: 'Winter-Examples' with: [ spec requires: #('Winter-Chipmunk2D') ].
			
			spec
				group: 'Development'
					with:
					#('Winter-AssetManagement' 'Winter-AssetManagementTests' 'Winter-Core' 'Winter-CoreTests' 'Winter-Chipmunk2D' 'Winter-Chipmunk2DTests' 'Winter-Morphic');
				group: 'Full' with: #('Development' 'Winter-Examples' 'Winter-AthensPlayground');
				group: 'default' with: #('Full') ]