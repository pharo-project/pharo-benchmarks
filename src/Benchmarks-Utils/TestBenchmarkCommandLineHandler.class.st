Class {
	#name : #TestBenchmarkCommandLineHandler,
	#superclass : #TestCase,
	#instVars : [
		'commandLineHandler'
	],
	#category : #'Benchmarks-Utils-Tests'
}

{ #category : #tests }
TestBenchmarkCommandLineHandler >> setUp [

	super setUp.
	
	commandLineHandler := BenchmarkCommandLineHandler new.
	commandLineHandler beTesting
]

{ #category : #tests }
TestBenchmarkCommandLineHandler >> testAbsoluteOutputFileResolution [

	commandLineHandler commandLine: (CommandLineArguments withArguments: #( #MockBenchSuite #benchMock '--out=/toto' )).
	
	self assert: commandLineHandler outputFileReference equals: FileSystem root / 'toto'
]

{ #category : #tests }
TestBenchmarkCommandLineHandler >> testDefaultIterationsIsNil [

	commandLineHandler commandLine: (CommandLineArguments withArguments: #( #MockBenchSuite #benchMock )).
	
	self assert: commandLineHandler iterations equals: nil
]

{ #category : #tests }
TestBenchmarkCommandLineHandler >> testDefaultOutputFileName [

	commandLineHandler commandLine: (CommandLineArguments withArguments: #( #MockBenchSuite #benchMoc )).
	
	self assert: commandLineHandler outputFileName equals: 'out.json'
]

{ #category : #tests }
TestBenchmarkCommandLineHandler >> testDefaultProblemSizeIsNil [

	commandLineHandler commandLine: (CommandLineArguments withArguments: #( #MockBenchSuite #benchMock )).
	
	self assert: commandLineHandler problemSize equals: nil
]

{ #category : #tests }
TestBenchmarkCommandLineHandler >> testParseBenchmarkClassName [

	commandLineHandler commandLine: (CommandLineArguments withArguments: #( #MockBenchSuite #benchMock )).
	
	self assert: commandLineHandler benchmarkClassName equals: #MockBenchSuite
]

{ #category : #tests }
TestBenchmarkCommandLineHandler >> testParseBenchmarkSelector [

	commandLineHandler commandLine: (CommandLineArguments withArguments: #( #MockBenchSuite #benchMock )).
	
	self assert: commandLineHandler selector equals: #benchMock
]

{ #category : #tests }
TestBenchmarkCommandLineHandler >> testParseIterations [

	commandLineHandler commandLine: (CommandLineArguments withArguments: #( #MockBenchSuite #benchMock '--iterations=50' )).
	
	self assert: commandLineHandler iterations equals: 50
]

{ #category : #tests }
TestBenchmarkCommandLineHandler >> testParseOutputFileName [

	commandLineHandler commandLine: (CommandLineArguments withArguments: #( #MockBenchSuite #benchMock '--out=toto' )).
	
	self assert: commandLineHandler outputFileName equals: 'toto'
]

{ #category : #tests }
TestBenchmarkCommandLineHandler >> testParseProblemSize [

	commandLineHandler commandLine: (CommandLineArguments withArguments: #( #MockBenchSuite #benchMock '--problemSize=100' )).
	
	self assert: commandLineHandler problemSize equals: 100
]

{ #category : #tests }
TestBenchmarkCommandLineHandler >> testParseWrongIterations [

	commandLineHandler commandLine: (CommandLineArguments withArguments: #( #MockBenchSuite #benchMock '--iterations=abc' )).
	
	[ 	commandLineHandler iterations.
		self fail ]
		on: Error do: [ :e |
			self assert: (e messageText beginsWith: 'Reading a number failed:') ]
]

{ #category : #tests }
TestBenchmarkCommandLineHandler >> testParseWrongProblemSize [

	commandLineHandler commandLine: (CommandLineArguments withArguments: #( #MockBenchSuite #benchMock '--problemSize=abc' )).
	
	[ 	commandLineHandler problemSize.
		self fail ]
		on: Error do: [ :e |
			self assert: (e messageText beginsWith: 'Reading a number failed:') ]
]

{ #category : #tests }
TestBenchmarkCommandLineHandler >> testRelativeOutputFileResolution [

	commandLineHandler commandLine: (CommandLineArguments withArguments: #( #MockBenchSuite #benchMock '--out=toto' )).
	
	self assert: commandLineHandler outputFileReference equals: FileLocator workingDirectory / 'toto'
]
