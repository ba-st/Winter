Events
updateUsing: aCanvas


	self players do: [ :eachPlayer | eachPlayer updateUsing: aCanvas ].
	self components do: [ :eachShape | eachShape updateUsing: aCanvas ]