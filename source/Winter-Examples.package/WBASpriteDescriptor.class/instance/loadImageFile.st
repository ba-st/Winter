Bootstrap
loadImageFile

	^ WinterAssetManagementSystem current
		assetNamed: fileName
		ifAbsent: [ self basicLoadImageFile ]