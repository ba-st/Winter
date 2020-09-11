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
			]
]

{ #category : #accessing }
BaselineOfWinter >> projectClass [ 

	^ MetacelloCypressBaselineProject
]

{ #category : #baseline }
BaselineOfWinter >> setUpDependenciesFor: spec [

	spec
		configuration: 'PharoSound'
			with: [ spec
				versionString: #stable;
				repository: 'http://smalltalkhub.com/mc/PharoExtras/Sound/main'
			];
		configuration: 'XMLParser'
			with: [ spec
				versionString: #stable;
				repository: 'http://smalltalkhub.com/mc/PharoExtras/XMLParser/main'
			];
		baseline: 'Buoy'
			with: [ spec
				repository: 'github://ba-st/Buoy:v5.4.0/source';
				loads: #('Deployment')
			];
		import: 'Buoy'
]

{ #category : #baseline }
BaselineOfWinter >> setUpGroupsFor: spec [

	^ spec
		group: 'Tests' with: #('Winter-AssetManagementTests' 'Winter-CoreTests' 'Winter-EcsTests' 'Winter-PhysicsTests' 'Winter-TiledTests');
		group: 'Deployment'
			with: #('Winter-AssetManagement' 'Winter-Core' 'Winter-Ecs' 'Winter-View' 'Winter-Physics' 'Winter-Tiled' 'Winter-Examples');
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
		package: 'Winter-EcsTests' with: [ spec requires: #('Winter-Ecs') ];
		package: 'Winter-Physics';
		package: 'Winter-PhysicsTests' with: [ spec requires: #('Winter-Physics') ];
		package: 'Winter-View' with: [ spec requires: #('Winter-Core' 'Buoy') ];
		package: 'Winter-Examples' with: [ spec requires: #('Winter-View' 'Winter-Physics' 'Winter-AssetManagement') ];
		package: 'Winter-Tiled' with: [ spec requires: #('XMLParser') ];
		package: 'Winter-TiledTests' with: [ spec requires: #('Winter-Tiled') ]
]
