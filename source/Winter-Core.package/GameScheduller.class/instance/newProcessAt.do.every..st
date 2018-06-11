private
newProcessAt: priority do: aBlock every: duration
	^ [ 
		[ | time delay |
		time := DateAndTime now.
		aBlock value.
		delay := duration - (DateAndTime now - time).
		delay negative 
			ifFalse: [ delay wait ]
			ifTrue: [ "slowing process" ]
		 ] repeat ] forkAt: priority