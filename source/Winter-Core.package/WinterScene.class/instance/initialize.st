initialization
initialize 
	super initialize.
	eventQueue := WinterQueue new.
	components := #().
	active := false.