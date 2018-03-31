initialization
initialize

	super initialize.
	title := ''.
	self openWindow.
	scheduler := WinterRenderingScheduller managing:  self