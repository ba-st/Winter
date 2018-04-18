private
openWindow

	window := OSWindow createWithAttributes: (OSWindowAttributes new resizable: false; yourself).
	window title: title.