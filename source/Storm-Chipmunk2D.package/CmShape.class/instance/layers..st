accessing
layers: layers
self flag: 'ver senders y borrar'.
	^ self ffiCall:  #( void cpShapeSetLayers(self, layers) )