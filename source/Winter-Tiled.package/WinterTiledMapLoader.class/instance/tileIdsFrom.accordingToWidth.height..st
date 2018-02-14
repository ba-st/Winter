Parsing - Tilesets
tileIdsFrom: aLayerElement accordingToWidth: aWidth height: aHeight
	
	| dataElement encoding ids datas compression inputStream byteArray y x readBytePosition nextReadBytesPosition |
	
	dataElement := aLayerElement elementAt: #data ifAbsent: [ nil ].
	encoding := dataElement attributeAt: #encoding ifAbsent: [ nil ].
	ids := Array new: aWidth * aHeight.

	"no 'encoding' attribute means that the encoding is XML"
	encoding
		ifNil: [ Error signal: 'Unsuported encoding (XML) for TMX Layer Data' ]
		ifNotNil: [ encoding = 'cvs'
				ifTrue: [ datas := dataElement firstNode asString substrings: ','.
					ids := datas collect: [ :each | Integer readFrom: each trim ] asArray ]
				ifFalse: [ encoding = 'base64'
						ifTrue: [ compression := dataElement attributeAt: #compression ifAbsent: [ nil ].
							compression
								ifNil: [ inputStream := Base64MimeConverter mimeDecodeToBytes: dataElement firstNode asString ]
								ifNotNil: [ compression = 'gzip'
										ifTrue: [ inputStream := GZipReadStream on: (Base64MimeConverter mimeDecodeToBytes: dataElement firstNode asString) ]
										ifFalse: [ compression = 'zlib'
												ifTrue: [ inputStream := ZLibReadStream on: (Base64MimeConverter mimeDecodeToBytes: dataElement firstNode asString) ]
												ifFalse: [ Error signal: ('Unrecognised compression (<1s>) for TMX Layer Data' expandMacrosWith: compression) ] ] ].
							byteArray := ByteArray new: 4.
							y := 0.
							x := 0.
							self flag: 'Cambiar los whileTrue y refactorizar'.
							y < aHeight
								whileTrue: [ x < aWidth
										whileTrue: [ readBytePosition := inputStream next: 1 into: byteArray.
											readBytePosition < byteArray size
												whileTrue: [ nextReadBytesPosition := inputStream readInto: byteArray startingAt: readBytePosition count: byteArray size - readBytePosition.
													nextReadBytesPosition = 1 negated
														ifTrue: [ readBytePosition := byteArray size ]
														ifFalse: [ readBytePosition := readBytePosition + nextReadBytesPosition ] ].
											readBytePosition ~= byteArray size
												ifTrue: [ Error signal: 'Error Reading TMX Layer Data: Premature end of tile data' ]
												ifFalse: [ ids
														at: y * aWidth + x
														put:
															(byteArray at: 1) asInteger | ((byteArray at: 2) asInteger << 8) | ((byteArray at: 3) asInteger << 16)
																| ((byteArray at: 4) asInteger << 24) ].
											x := x + 1 ].
									y := y + 1 ].
							^ ids ]
						ifFalse: [ Error signal: ('Unrecognised encoding ( <1s> ) for TMX Layer Data' expandMacrosWith: encoding) ] ] ]