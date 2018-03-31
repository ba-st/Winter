initialization
initialize

	super initialize.
	process := self newProcessAt: 30 do: [ managedObject  render ] every: self minTimeBetweenRendering.