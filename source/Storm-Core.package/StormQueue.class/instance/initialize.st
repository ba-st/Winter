initialization
initialize 
	super initialize.
	objects := self newCollection.
	mutex := Mutex new. 