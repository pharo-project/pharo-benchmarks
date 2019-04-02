Class {
	#name : #BenchmarkRunnerCommandLineHandler,
	#superclass : #CommandLineHandler,
	#instVars : [
		'csvReporter',
		'stream',
		'jsonReporter'
	],
	#category : #'Benchmarks-Utils'
}

{ #category : #accessing }
BenchmarkRunnerCommandLineHandler class >> commandName [
	^ 'benchmark'
]

{ #category : #accessing }
BenchmarkRunnerCommandLineHandler class >> description [

	^ 'Executes the instructed benchmarks'
]

{ #category : #activation }
BenchmarkRunnerCommandLineHandler >> activate [
	| packageExpression packages reports |

	self activateHelp ifTrue: [ ^ self ].
	self validateParameters.
	
	packageExpression := (self argumentAt: 1) asRegex.	

	packages := RPackageOrganizer default packages select: [ :e | packageExpression matches: e name ].
	
	reports := packages flatCollect: [:aPackage | 
					(BenchmarkRunner forPackage: aPackage)
						iterations: self iterations;
						run ].
					
	reports do: [ :e | self report: e ].
	
	self reporter endReport.
	
	self closeStream.
	
	self exitSuccess
]

{ #category : #activation }
BenchmarkRunnerCommandLineHandler >> closeStream [
	
	(self hasOption: 'output')
		ifTrue: [ stream close ]
		ifFalse: [ Stdio stdout flush ]
]

{ #category : #activation }
BenchmarkRunnerCommandLineHandler >> csvReporter [

	^ csvReporter ifNil: [ csvReporter := BenchmarkRunnerReporterCSV new
														outputStream: self stream;
														writeHeader;
														yourself]
]

{ #category : #activation }
BenchmarkRunnerCommandLineHandler >> iterations [

	^ (self commandLine hasOption: 'iterations')
		ifTrue: [ (self commandLine optionAt: 'iterations') asInteger ]
		ifFalse: [ 1000 ]
]

{ #category : #activation }
BenchmarkRunnerCommandLineHandler >> jsonReporter [

	^ jsonReporter ifNil: [ jsonReporter := BenchmarkRunnerReporterJSON new
														outputStream: self stream;
														yourself]
]

{ #category : #activation }
BenchmarkRunnerCommandLineHandler >> report: aRunner [

	self reporter 
		runner: aRunner;
		report
]

{ #category : #activation }
BenchmarkRunnerCommandLineHandler >> reporter [

	(self hasOption: 'csv')
		ifTrue: [ ^ self csvReporter ].

	(self hasOption: 'json')
		ifTrue: [ ^ self jsonReporter ].

	^ SMarkReporter defaultReporter new
		outputStream: self stream;
		yourself

]

{ #category : #activation }
BenchmarkRunnerCommandLineHandler >> stream [
	
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
BenchmarkRunnerCommandLineHandler >> validateParameters [
	
	(self commandLine hasArguments)
		ifFalse: [ ^ self exitFailure: 'Missing regular expression for filtering packages' ]
	
]
