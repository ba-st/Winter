Bootstrap
loadImageFile

	^ Cache 
		at: fileName 
		ifAbsentPut: [ self basicLoadImageFile ]