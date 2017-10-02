profiling
profileAtStep: aNumber
	| profiled time1 time2 |
	
	profiled  := 1.
	stepWalker := "StormBatch do:" [
		profiled = aNumber
			ifTrue: [ 
				TimeProfiler spyOn: [
					self currentScene step ] ]
			ifFalse: [ self currentScene step ].
		profiled := profiled + 1 ]