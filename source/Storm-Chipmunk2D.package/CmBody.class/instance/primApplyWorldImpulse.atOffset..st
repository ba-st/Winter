private
primApplyWorldImpulse: impulseVector atOffset: offsetVector
	^ self indirectCall: #(
		void cpBodyApplyImpulseAtWorldPoint(self,
			cpVect impulseVector,
			cpVect offsetVector) )
	