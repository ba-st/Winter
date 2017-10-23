baseline
setUpDependenciesFor: spec
	spec
		configuration: 'PharoSound'
		with: [ spec
				versionString: #stable;
repository: 'http://smalltalkhub.com/mc/PharoExtras/Sound/main' ];

		configuration: 'XMLParser'
		with: [ spec
				versionString: #stable;
repository: 'http://smalltalkhub.com/mc/PharoExtras/XMLParser/main' ]
