Extension { #name : #String }

{ #category : #'*Winter-Pharo6-Support' }
String >> base64Decoded [
	"Decode the receiver assuming it was encoded using Base64, returning a ByteArray.
	Base64 encoding is a technique to represent binary data as ASCII text.
	The inverse operation is ByteArray>>#base64Encoded"
	
	"'AgMFBwsNERMXHR8lKSsvNTs9Q0dJT1NZYWVna21xf4OJi5WXnaOnrbO1v8HFx9Pf4+Xp7/H7' base64Decoded"
	"'SGVsbG8gV29ybGQh' base64Decoded utf8Decoded"
	
	^ ZnBase64Encoder new decode: self
]
