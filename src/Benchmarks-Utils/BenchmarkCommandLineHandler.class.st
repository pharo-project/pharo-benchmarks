Class {
	#name : #BenchmarkCommandLineHandler,
	#superclass : #CommandLineHandler,
	#instVars : [
		'reporters',
		'testing'
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
	| packageExpression packages smarkRunners previousRun |

	self activateHelp ifTrue: [ ^ self ].
	self validateParameters.
	
	packageExpression := (self argumentAt: 1) asRegex.	

	packages := RPackageOrganizer default packages select: [ :e | packageExpression matches: e name ].
	
	smarkRunners := packages flatCollect: [:aPackage | 
					(BenchmarkPackageRunner forPackage: aPackage)
						iterations: self iterations;
						run ].
					
	previousRun := self loadPreviousRun.
	
	self reporters do: [ :aReporter | aReporter reportAll: smarkRunners previousRun: previousRun ].
	
	self exitSuccess 
	
]

{ #category : #'as yet unclassified' }
BenchmarkCommandLineHandler >> beTesting [

	testing := true
]

{ #category : #activation }
BenchmarkCommandLineHandler >> exitSuccess [

	self isTesting
		ifFalse: [ super exitSuccess ]
]

{ #category : #'as yet unclassified' }
BenchmarkCommandLineHandler >> isTesting [

	^ testing ifNil: [ false ]
]

{ #category : #activation }
BenchmarkCommandLineHandler >> iterations [

	^ (self commandLine hasOption: 'iterations')
		ifTrue: [ (self commandLine optionAt: 'iterations') asInteger ]
		ifFalse: [ 1000 ]
]

{ #category : #activation }
BenchmarkCommandLineHandler >> loadPreviousRun [

	^ self commandLine
		optionAt: 'previousRun'
		ifPresent: [ :v | | fileReference |
			fileReference := v asFileReference.
			
			fileReference exists 
				ifTrue: [fileReference readStreamDo: [:s | STON fromStream: s]]
				ifFalse: [ nil ]]
		ifAbsent: [ nil ]
]

{ #category : #activation }
BenchmarkCommandLineHandler >> reporters [

	^ reporters ifNil: [ ^ { BenchmarkRunnerDefaultReporter new } ]
]

{ #category : #activation }
BenchmarkCommandLineHandler >> validateParameters [
	
	(self commandLine hasArguments)
		ifFalse: [ ^ self exitFailure: 'Missing regular expression for filtering packages' ].
	
	reporters := OrderedCollection new.
	
	AbstractBenchmarkCommandLineReporter allSubclasses 
		do: [ :e | e configureFrom: self commandLine andAddTo: reporters ]
]
