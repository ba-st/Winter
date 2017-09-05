baseline
baseline: spec
	<baseline>
	spec for: #common do: [
		spec
			package: 'Storm-Core' ;
			package: 'Storm-Chipmunk2D' with: [ spec requires: #('Storm-Core') ];
			package: 'Storm-Morphic' with: [ spec requires: #('Storm-Chipmunk2D') ];
			package: 'Storm-Examples' with: [ spec requires: #('Storm-Chipmunk2D') ];
			package: 'Storm-AthensPlayground' .
		spec
				group: 'Deployment' with: #('Storm-Core' 'Storm-Chipmunk2D' 'Storm-Morphic');
				group: 'Development' with: #('Deployment' 'Storm-Examples' 'Storm-AthensPlayground');
group: 'default' with: #('Deployment')
		
	]
