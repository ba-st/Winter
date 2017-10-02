accessing
add: anObject 
	mutex critical: [ 
		objects add: anObject ]