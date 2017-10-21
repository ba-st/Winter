initialization
initialize 
	super initialize.
	players := OrderedCollection new.
	eventQueue := WinterQueue new.
	components := #().
	active := false.