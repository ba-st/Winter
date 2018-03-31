private
newProcessAt: priority do: aBlock every: duration

	^ (Process
		forContext: (self processContextUsing: aBlock during: duration) asContext 
		priority: priority)
		name: self name;
		yourself	