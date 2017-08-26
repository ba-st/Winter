start/stop
stop
	engine isStepping 
		ifTrue: [ engine stopStepping ].
	"Hack to allow me play with blocks and batchers"
	(stepWalker respondsTo: #terminateProcess)
		ifTrue: [ stepWalker terminateProcess ]