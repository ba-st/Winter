Test Support
createImage

	(Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self pharoImageOnBase64)) writePNGFileNamed: 'pharo.png'