instance creation
newBoxBody: aBody extent: aPoint
	"Creates a box shape with extent"	
	self flag: 'should this call #initialize?'.
	self flag: 'falta el radius'.
	^ self 
		primCpBoxNew: aBody
		width: aPoint x asFloat
		height: aPoint y asFloat