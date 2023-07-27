Class {
	#name : #BaselineOfWinter,
	#superclass : #BaselineOf,
	#category : #BaselineOfWinter
}

{ #category : #baseline }
BaselineOfWinter >> baseline: spec [

	<baseline>
	spec for: #pharo do: [
		self setUpDependenciesFor: spec.
		self setUpPackagesFor: spec.
		self setUpGroupsFor: spec ].

	spec for: #'pharo7.x' do: [
		spec
			package: 'Winter-Pharo7-Support';
			group: 'Development' with: 'Winter-Pharo7-Support' ].

	spec for: #( #'pharo9.x' #'pharo10.x' #'pharo11.x' ) do: [
		spec
			package: 'Winter-Pharo9-Support';
			group: 'Development' with: 'Winter-Pharo9-Support' ]
]

{ #category : #accessing }
BaselineOfWinter >> projectClass [ 

	^ MetacelloCypressBaselineProject
]

{ #category : #baseline }
BaselineOfWinter >> setUpDependenciesFor: spec [

	spec
		baseline: 'Buoy'
			with: [ spec
				repository: 'github://ba-st/Buoy:v6/source';
				loads: #('Deployment')
			];
		import: 'Buoy'.

	spec
		configuration: 'PharoSound'
		with: [ spec
				versionString: #stable;
				repository: 'http://smalltalkhub.com/mc/PharoExtras/Sound/main'
			]
]

{ #category : #baseline }
BaselineOfWinter >> setUpGroupsFor: spec [

	^ spec
		group: 'Tests' with: #('Winter-AssetManagementTests' 'Winter-CoreTests' 'Winter-EcsTest' 'Winter-PhysicsTests');
		group: 'Deployment'
			with: #('Winter-AssetManagement' 'Winter-Core' 'Winter-Ecs' 'Winter-View' 'Winter-Physics' 'Winter-Resources');
		group: 'Development' with: #('Deployment' 'Tests');
		group: 'CI' with: 'Tests';
		group: 'default' with: #('Development')
]

{ #category : #baseline }
BaselineOfWinter >> setUpPackagesFor: spec [

	spec
		package: 'Winter-AssetManagement' with: [ spec requires: #('PharoSound') ];
		package: 'Winter-AssetManagementTests' with: [ spec requires: #('Winter-AssetManagement') ];
		package: 'Winter-Core';
		package: 'Winter-CoreTests' with: [ spec requires: #('Winter-Core') ];
		package: 'Winter-Ecs';
		package: 'Winter-EcsTest' with: [ spec requires: #('Winter-Ecs') ];
		package: 'Winter-Physics' with: [ spec requires: #('Buoy') ];
		package: 'Winter-PhysicsTests' with: [ spec requires: #('Winter-Physics') ];
		package: 'Winter-View' with: [ spec requires: #('Winter-Core') ];
		package: 'Winter-Resources' with: [ spec requires: #('Winter-Physics') ]
]
