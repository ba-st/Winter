accessing
layers
self flag: 'ver senders y borrar'.
	^ self ffiCall:  #( cpLayers cpShapeGetLayers(self) )