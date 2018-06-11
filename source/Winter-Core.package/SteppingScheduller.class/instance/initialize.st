initialization
initialize

	super initialize.
	process := self newProcessAt: 30 do: [ managedObject  updateAndRender ] every: self minTimeBetweenRendering.