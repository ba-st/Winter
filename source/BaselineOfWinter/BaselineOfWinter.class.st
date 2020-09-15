Class {
	#name : #BaselineOfWinter,
	#superclass : #BaselineOf,
	#category : #BaselineOfWinter
}

{ #category : #baseline }
BaselineOfWinter >> baseline: spec [

	<baseline>
	spec
		for: #pharo
		do: [ self setUpDependenciesFor: spec.
			self setUpPackagesFor: spec.
			self setUpGroupsFor: spec
			].
	spec
		for: #'pharo6.x'
		do: [ spec
				package: 'Winter-Pharo6-Support';
				group: 'Tests' with: 'Winter-Pharo6-Support'
			]
]

{ #category : #accessing }
BaselineOfWinter >> projectClass [ 

	^ MetacelloCypressBaselineProject
]

{ #category : #baseline }
BaselineOfWinter >> setUpDependenciesFor: spec [

	spec
		baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v6/source' ];
		project: 'Buoy-Deployment' copyFrom: 'Buoy' with: [ spec loads: 'Deployment' ];
		project: 'Buoy-SUnit' copyFrom: 'Buoy' with: [ spec loads: 'Dependent-SUnit-Extensions' ];
		project: 'Buoy-Tools' copyFrom: 'Buoy' with: [ spec loads: 'Tools' ].
		
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
			with: #('Winter-AssetManagement' 'Winter-Core' 'Winter-Ecs' 'Winter-View' 'Winter-Physics' 'Winter-Examples');
		group: 'Development' with: #('Deployment' 'Tests');
		group: 'CI' with: 'Tests';
		group: 'default' with: #('Development')
]

{ #category : #baseline }
BaselineOfWinter >> setUpPackagesFor: spec [

	spec
		package: 'Winter-AssetManagement' with: 'PharoSound';
		package: 'Winter-AssetManagementTests' with: 'Winter-AssetManagement';
		package: 'Winter-Core';
		package: 'Winter-CoreTests' with: 'Winter-Core';
		package: 'Winter-Ecs';
		package: 'Winter-EcsTest' with: 'Winter-Ecs';
		package: 'Winter-Physics' with: 'Buoy-Deployment';
		package: 'Winter-PhysicsTests' with: 'Winter-Physics';
		package: 'Winter-View' with: 'Winter-Core';
		package: 'Winter-Examples'
			with: [ spec requires: #('Winter-View' 'Winter-Physics' 'Winter-AssetManagement') ]
]
