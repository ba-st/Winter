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
		baseline: 'Kepler'
			with: [ spec
				repository: 'github://ba-st/Kepler:v4.1.0/source';
				loads: #('Deployment')
			];
		configuration: 'XMLParser'
			with: [ spec
				versionString: #stable;
				repository: 'http://smalltalkhub.com/mc/PharoExtras/XMLParser/main'
			]
]

{ #category : #baseline }
BaselineOfWinter >> setUpGroupsFor: spec [

	^ spec
		group: 'Tests'
			with: #('Winter-AssetManagementTests' 'Winter-CoreTests' 'Winter-Core2DTests' 'Winter-TiledTests');
		group: 'Deployment'
			with:
			#('Winter-AssetManagement' 'Winter-Core' 'Winter-Core2D' 'Winter-View' 'Winter-Tiled' 'Winter-Examples');
		group: 'Development' with: #('Deployment' 'Tests');
		group: 'CI' with: 'Tests';
		group: 'default' with: #('Development')
]

{ #category : #baseline }
BaselineOfWinter >> setUpPackagesFor: spec [

	spec
		package: 'Winter-AssetManagement' with: [ spec requires: #('PharoSound' 'Kepler') ];
		package: 'Winter-AssetManagementTests' with: [ spec requires: #('Winter-AssetManagement') ];
		package: 'Winter-Core' with: [ spec requires: #('Winter-AssetManagement') ];
		package: 'Winter-Core2D' with: [ spec requires: #('Winter-Core') ];
		package: 'Winter-Core2DTests';
		package: 'Winter-CoreTests';
		package: 'Winter-View' with: [ spec requires: #('Winter-Core2D') ];
		package: 'Winter-Examples' with: [ spec requires: #('Winter-Core2D') ];
		package: 'Winter-Tiled' with: [ spec requires: #('XMLParser') ];
		package: 'Winter-TiledTests' with: [ spec requires: #('Winter-Tiled') ]
]
