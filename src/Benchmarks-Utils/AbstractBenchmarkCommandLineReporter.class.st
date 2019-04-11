Class {
	#name : #AbstractBenchmarkCommandLineReporter,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #'Benchmarks-Utils-Output'
}

{ #category : #'as yet unclassified' }
AbstractBenchmarkCommandLineReporter class >> configureFrom: commandLine andAddTo: reporters [

	(self isDefault)
		ifTrue: [ ^ self ].

	(commandLine hasOption: self optionName)
		ifFalse: [ ^ self ].
		
	reporters add: (self new
		configureFrom: commandLine;
		yourself)
	

]

{ #category : #'as yet unclassified' }
AbstractBenchmarkCommandLineReporter class >> isDefault [ 
	
	^ false
]

{ #category : #'as yet unclassified' }
AbstractBenchmarkCommandLineReporter class >> optionName [

	^ self subclassResponsibility
]

{ #category : #configuring }
AbstractBenchmarkCommandLineReporter >> configureFrom: aCommandLineArguments [

	aCommandLineArguments
		optionAt: self optionName
		ifPresent: [ :aFileName | self configureStream: aFileName asFileReference ]
]

{ #category : #configuring }
AbstractBenchmarkCommandLineReporter >> configureStream: aFileReference [ 
	
	stream := ((ZnNewLineWriterStream on: aFileReference writeStream)
							forPlatformLineEnding;
							yourself).
]

{ #category : #accessing }
AbstractBenchmarkCommandLineReporter >> optionName [
	
	^ self class optionName
]

{ #category : #accessing }
AbstractBenchmarkCommandLineReporter >> reportAll: smarkRunners previousRun: previousRun [

	self subclassResponsibility
]

{ #category : #accessing }
AbstractBenchmarkCommandLineReporter >> stream [

	^ stream ifNil: [ (ZnNewLineWriterStream on: Stdio stdout)
								forPlatformLineEnding;
								yourself. ]
]
