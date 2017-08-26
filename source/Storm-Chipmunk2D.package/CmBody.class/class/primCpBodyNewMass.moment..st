private
primCpBodyNewMass: m moment: i
	^ self ffiCall: #(CmBody cpBodyNew(cpFloat m, cpFloat i))