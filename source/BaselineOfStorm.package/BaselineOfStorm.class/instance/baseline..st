baseline
baseline: spec
	<baseline>
	spec for: #common do: [
		spec
			package: 'Storm-Core' with: [ spec requires: #('UnifiedFFI' 'Athens') ];
			package: 'Storm-2D' with: [ spec requires: #('Storm-Core') ];
			package: 'Storm-Morphic' with: [ spec requires: #('Storm-2D') ];
			package: 'Storm-Tests' with: [ spec requires: #('Storm-2D') ];
			package: 'Athens-Playground' with: [ spec requires: #('Athens') ].
		
		self athens: spec.
		self unifiedffi: spec.
	]
