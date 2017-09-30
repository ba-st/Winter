baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ self setUpDependenciesFor: spec.
			spec
				package: 'Storm-AssetManagement' with: [ spec requires: #('PharoSound') ];
				package: 'Storm-AssetManagementTests' with: [ spec requires: #('Storm-AssetManagement') ];
				package: 'Storm-Core' with: [ spec requires: #('Storm-AssetManagement') ];
				package: 'Storm-CoreTests' with: [ spec requires: #('Storm-Core') ];
				package: 'Storm-Chipmunk2D' with: [ spec requires: #('Storm-Core') ];
				package: 'Storm-Chipmunk2DTests' with: [ spec requires: #('Storm-Chipmunk2D') ];
				package: 'Storm-Morphic' with: [ spec requires: #('Storm-Chipmunk2D') ];
				package: 'Storm-Examples' with: [ spec requires: #('Storm-Chipmunk2D') ];
				package: 'Storm-AthensPlayground'.
			spec
				group: 'Development'
					with:
					#('Storm-AssetManagement' 'Storm-AssetManagementTests' 'Storm-Core' 'Storm-CoreTests' 'Storm-Chipmunk2D' 'Storm-Chipmunk2DTests' 'Storm-Morphic');
				group: 'Full' with: #('Development' 'Storm-Examples' 'Storm-AthensPlayground');
				group: 'default' with: #('Full') ]