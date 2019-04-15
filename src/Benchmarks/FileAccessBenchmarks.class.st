Class {
	#name : #FileAccessBenchmarks,
	#superclass : #AbstractPharoBenchmarks,
	#category : #Benchmarks
}

{ #category : #benchmarking }
FileAccessBenchmarks >> benchFileOpeningForRead [

	<problemSize: 5000>
	self existingFile readStreamDo: [ :s | s upToEnd ]
]

{ #category : #benchmarking }
FileAccessBenchmarks >> benchFileOpeningForReadBinary [

	<problemSize: 5000>
	self existingBinaryFile binaryReadStreamDo: [ :s | s upToEnd ]
]

{ #category : #benchmarking }
FileAccessBenchmarks >> benchFileOpeningForWrite [

	<problemSize: 5000>
	
	self nonExistingFile writeStreamDo: [ :s | s nextPutAll: (String loremIpsum) ]
]

{ #category : #benchmarking }
FileAccessBenchmarks >> benchFileOpeningForWriteBinary [

	<problemSize: 5000>
	
	self nonExistingBinaryFile binaryWriteStreamDo: [ :s | s nextPutAll: (String loremIpsum) utf8Encoded ]
]

{ #category : #benchmarking }
FileAccessBenchmarks >> benchFileReadingLongBinaryFile [

	<problemSize: 10>
	
	self existingLongBinaryFile binaryReadStreamDo: [ :s | s upToEnd ].

]

{ #category : #benchmarking }
FileAccessBenchmarks >> benchFileReadingLongFile [

	<problemSize: 10>
	
	self existingLongFile readStreamDo: [ :s | s upToEnd ].

]

{ #category : #benchmarking }
FileAccessBenchmarks >> benchFileWritingLongBinaryFile [

	<problemSize: 5>
	
	self nonExistingBinaryFile binaryWriteStreamDo: [ :s | s nextPutAll: (String loremIpsum: 1024*1024*5) utf8Encoded ]
]

{ #category : #benchmarking }
FileAccessBenchmarks >> benchFileWritingLongFile [

	<problemSize: 5>
	
	self nonExistingFile writeStreamDo: [ :s | s nextPutAll: (String loremIpsum: 1024*1024*5) ]
]

{ #category : #utils }
FileAccessBenchmarks >> ensureExistingFile [
	
	self existingFile writeStreamDo: [ :s | s nextPutAll: 'Some content to read!' ].
	self existingLongFile writeStreamDo: [ :s | s nextPutAll: (String loremIpsum: 1024*1024*5) ].
	
	self existingBinaryFile binaryWriteStreamDo: [ :s | s nextPutAll: 'Some content to read!' utf8Encoded ].
	self existingLongBinaryFile binaryWriteStreamDo: [ :s | s nextPutAll: (String loremIpsum: 1024*1024*5) utf8Encoded ].
]

{ #category : #utils }
FileAccessBenchmarks >> existingBinaryFile [
	
	^ 'existingFile.bin' asFileReference 
]

{ #category : #utils }
FileAccessBenchmarks >> existingFile [
	
	^ 'existingFile.txt' asFileReference 
]

{ #category : #utils }
FileAccessBenchmarks >> existingLongBinaryFile [
	
	^ 'existingLongFile.bin' asFileReference 
]

{ #category : #utils }
FileAccessBenchmarks >> existingLongFile [
	
	^ 'existingLongFile.txt' asFileReference 
]

{ #category : #utils }
FileAccessBenchmarks >> nonExistingBinaryFile [
	
	^ 'nonExistingFile.bin' asFileReference 
]

{ #category : #utils }
FileAccessBenchmarks >> nonExistingFile [
	
	^ 'nonExistingFile.txt' asFileReference 
]

{ #category : #running }
FileAccessBenchmarks >> setUp [

	super setUp.
	
	self ensureExistingFile.
	self nonExistingFile ensureDelete.
	self nonExistingBinaryFile ensureDelete.	
]

{ #category : #running }
FileAccessBenchmarks >> tearDown [ 
	
	self existingFile ensureDelete.
	self existingLongFile ensureDelete.
	self existingBinaryFile ensureDelete.
	self existingLongBinaryFile ensureDelete.

	self nonExistingFile ensureDelete.
	self nonExistingBinaryFile ensureDelete.
	super tearDown 
]
