initialize
registerEventsForShout 
	super registerEventsForShout.
	workspace whenChangedDo: [ :aBoolean | 
		self widget ifNotNil: [ :w | w setStylerForWorkspace: aBoolean ].
		self changed: #getText ].