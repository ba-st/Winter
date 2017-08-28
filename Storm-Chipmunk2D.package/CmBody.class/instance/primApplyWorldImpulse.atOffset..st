private
primApplyWorldImpulse: impulseVector atOffset: offsetVector
	^ self ffiCall:  #(
		void cpBodyApplyImpulseAtWorldPoint(self,
			cpVect impulseVector,
			cpVect offsetVector) )
	