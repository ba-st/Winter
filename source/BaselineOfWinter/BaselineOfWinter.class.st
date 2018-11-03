Class {
	#name : #BaselineOfWinter,
	#superclass : #BaselineOf,
	#category : #BaselineOfWinter
}

{ #category : #baseline }
BaselineOfWinter >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self setUpDependenciesFor: spec.
			spec
				package: 'Winter-AssetManagement' with: [ spec requires: #('PharoSound') ];
				package: 'Winter-AssetManagementTests' with: [ spec requires: #('Winter-AssetManagement') ];
				package: 'Winter-Core' with: [ spec requires: #('Winter-AssetManagement') ];
				package: 'Winter-Core2D' with: [ spec requires: #('Winter-Core') ];
				package: 'Winter-TestResources' with:[ spec requires: #('Winter-Core2D') ];
				package: 'Winter-Core2DTests' with: [ spec requires: #('Winter-TestResources') ];
				package: 'Winter-CoreTests' with: [ spec requires: #('Winter-TestResources') ];
				package: 'Winter-View' with: [ spec requires: #('Winter-Core2D') ];
				package: 'Winter-Examples' with: [ spec requires: #('Winter-Core2D') ];
				package: 'Winter-Tiled' with: [ spec requires: #('XMLParser') ];
				package: 'Winter-TiledTests' with: [ spec requires: #('Winter-Tiled') ].
			
			spec
				group: 'Development'
					with:
					#('Winter-AssetManagement' 'Winter-AssetManagementTests' 'Winter-Core' 'Winter-CoreTests' 'Winter-Core2D' 'Winter-Core2DTests' 'Winter-View' 'Winter-Tiled' 'Winter-TiledTests' 'Winter-TestResources');
				group: 'Full' with: #('Development' 'Winter-Examples');
				group: 'default' with: #('Full') ]

]

{ #category : #baseline }
BaselineOfWinter >> setUpDependenciesFor: spec [

	spec
		configuration: 'PharoSound'
		with: [ spec
				versionString: #stable;
repository: 'http://smalltalkhub.com/mc/PharoExtras/Sound/main' ];

		configuration: 'XMLParser'
		with: [ spec
				versionString: #stable;
repository: 'http://smalltalkhub.com/mc/PharoExtras/XMLParser/main' ]

]
