private
indirectCall: fnSpec
	^ (self ffiCalloutIn: thisContext sender)
		convention: self ffiCallingConvention;
		options: #( optIndirectCall );
		function: fnSpec module: self ffiLibraryName