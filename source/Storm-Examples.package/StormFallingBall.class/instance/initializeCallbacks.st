initialization
initializeCallbacks
	beginCallback := CmCollisionBegin on: [:arbiter :space :data| Transcript show: 'begin';cr. true].
	preCallback := CmCollisionPreSolve on: [:arbiter :space :data| Transcript show: 'preSolve';cr. true].
	postCallback := CmCollisionPostSolve on: [:arbiter :space :data | Transcript show: 'postSolve';cr ].
	separateCallback := CmCollisionSeparate on: [:arbiter :space :data| Transcript show: 'separate';cr ].
	
	scenes first physicSpace
		setDefaultCollisionBegin: beginCallback
		preSolve: preCallback
		postSolve: postCallback
		separate: separateCallback
		data: nil