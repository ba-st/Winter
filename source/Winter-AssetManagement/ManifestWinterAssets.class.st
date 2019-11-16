"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestWinterAssets,
	#superclass : #PackageManifest,
	#category : #'Winter-AssetManagement'
}

{ #category : #'class initialization' }
ManifestWinterAssets class >> initialize [

	<ignoreForCoverage>
	Kepler
		registerInterfaceAt: #AssetsManagementSystemInterface
		named: 'Assets Management System Interface'
		declaring:
			#(#assets #sounds #sprites #addAsset: #addSound:named: #addSprite:named: #assetNamed: #removeAssetNamed:)
]
