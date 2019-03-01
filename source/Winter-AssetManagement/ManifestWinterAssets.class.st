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
		declaring: #(#assets #sounds #sprites #addAsset: #addSound:named: #addSprite:named: #assetNamed: #removeAssetNamed:)
]
