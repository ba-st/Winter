baseline
baseline: spec
	<baseline>
	spec for: #common do: [
		spec
			package: 'Storm-Core' with: [ "spec requires: #('UnifiedFFI' 'Athens') "];
			package: 'Storm-Chipmunk2D' with: [ spec requires: #('Storm-Core') ];
			package: 'Storm-Morphic' with: [ spec requires: #('Storm-Chipmunk2D') ];
			package: 'Storm-Examples' with: [ spec requires: #('Storm-Chipmunk2D') ];
			package: 'Athens-Playground' with: [ "spec requires: #('Athens')" ].
		spec
				group: 'Deployment' with: #('Storm-Core' 'Storm-Chipmunk2D' 'Storm-Morphic');
				group: 'Development' with: #('Deployment' 'Storm-Examples' 'Athens-Playground');
group: 'default' with: #('Deployment')
		"self athens: spec.
		self unifiedffi: spec."
	]
