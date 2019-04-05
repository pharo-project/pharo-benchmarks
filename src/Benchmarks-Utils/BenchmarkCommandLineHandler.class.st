Class {
	#name : #BenchmarkCommandLineHandler,
	#superclass : #CommandLineHandler,
	#instVars : [
		'csvReporter',
		'stream',
		'jsonReporter'
	],
	#category : #'Benchmarks-Utils-Core'
}

{ #category : #accessing }
BenchmarkCommandLineHandler class >> commandName [
	^ 'benchmark'
]

{ #category : #accessing }
BenchmarkCommandLineHandler class >> description [

	^ 'Executes the instructed benchmarks'
]

{ #category : #activation }
BenchmarkCommandLineHandler >> activate [
	| packageExpression packages reports |

	self activateHelp ifTrue: [ ^ self ].
	self validateParameters.
	
	packageExpression := (self argumentAt: 1) asRegex.	

	packages := RPackageOrganizer default packages select: [ :e | packageExpression matches: e name ].
	
	reports := packages flatCollect: [:aPackage | 
					(BenchmarkPackageRunner forPackage: aPackage)
						iterations: self iterations;
						run ].
					
	reports do: [ :e | self report: e ].
	
	self reporter endReport.
	
	self closeStream.
	
	self exitSuccess
]

{ #category : #activation }
BenchmarkCommandLineHandler >> closeStream [
	
	(self hasOption: 'output')
		ifTrue: [ stream close ]
		ifFalse: [ Stdio stdout flush ]
]

{ #category : #activation }
BenchmarkCommandLineHandler >> csvReporter [

	^ csvReporter ifNil: [ csvReporter := BenchmarkRunnerReporterCSV new
														outputStream: self stream;
														writeHeader;
														yourself]
]

{ #category : #activation }
BenchmarkCommandLineHandler >> iterations [

	^ (self commandLine hasOption: 'iterations')
		ifTrue: [ (self commandLine optionAt: 'iterations') asInteger ]
		ifFalse: [ 1000 ]
]

{ #category : #activation }
BenchmarkCommandLineHandler >> jsonReporter [

	^ jsonReporter ifNil: [ jsonReporter := BenchmarkRunnerReporterJSON new
														outputStream: self stream;
														yourself]
]

{ #category : #activation }
BenchmarkCommandLineHandler >> report: aRunner [

	self reporter 
		runner: aRunner;
		report
]

{ #category : #activation }
BenchmarkCommandLineHandler >> reporter [

	(self hasOption: 'csv')
		ifTrue: [ ^ self csvReporter ].

	(self hasOption: 'json')
		ifTrue: [ ^ self jsonReporter ].

	^ SMarkReporter defaultReporter new
		outputStream: self stream;
		yourself

]

{ #category : #activation }
BenchmarkCommandLineHandler >> stream [
	
	| inner |

	stream ifNotNil: [ ^ stream ].

	inner := (self hasOption: 'output')
		ifTrue: [ (self optionAt: 'output') asFileReference writeStream ]
		ifFalse: [ Stdio stdout ].
			
	^ stream := ((ZnNewLineWriterStream on: inner)
							forPlatformLineEnding;
							yourself).
]

{ #category : #activation }
BenchmarkCommandLineHandler >> validateParameters [
	
	(self commandLine hasArguments)
		ifFalse: [ ^ self exitFailure: 'Missing regular expression for filtering packages' ]
	
]
