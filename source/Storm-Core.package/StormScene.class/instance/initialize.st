initialization
initialize 
	super initialize.
	eventQueue := StormQueue new.
	components := #().
	active := false.