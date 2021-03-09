Class {
	#name : #PackageBenchmarkCommandLineHandler,
	#superclass : #CommandLineHandler,
	#instVars : [
		'reporters',
		'testing'
	],
	#category : #'Benchmarks-Utils-Core'
}

{ #category : #accessing }
PackageBenchmarkCommandLineHandler class >> commandName [
	^ 'benchmark'
]

{ #category : #accessing }
PackageBenchmarkCommandLineHandler class >> description [

	^ 'Executes the instructed benchmarks'
]

{ #category : #activation }
PackageBenchmarkCommandLineHandler >> activate [
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
PackageBenchmarkCommandLineHandler >> beTesting [

	testing := true
]

{ #category : #activation }
PackageBenchmarkCommandLineHandler >> exitSuccess [

	self isTesting
		ifFalse: [ super exitSuccess ]
]

{ #category : #'as yet unclassified' }
PackageBenchmarkCommandLineHandler >> isTesting [

	^ testing ifNil: [ false ]
]

{ #category : #activation }
PackageBenchmarkCommandLineHandler >> iterations [

	^ (self commandLine hasOption: 'iterations')
		ifTrue: [ (self commandLine optionAt: 'iterations') asInteger ]
		ifFalse: [ 1000 ]
]

{ #category : #activation }
PackageBenchmarkCommandLineHandler >> loadPreviousRun [

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
PackageBenchmarkCommandLineHandler >> reporters [

	^ reporters ifNil: [ ^ { BenchmarkRunnerDefaultReporter new } ]
]

{ #category : #activation }
PackageBenchmarkCommandLineHandler >> validateParameters [
	
	(self commandLine hasArguments)
		ifFalse: [ ^ self exitFailure: 'Missing regular expression for filtering packages' ].
	
	reporters := OrderedCollection new.
	
	AbstractBenchmarkCommandLineReporter allSubclasses 
		do: [ :e | e configureFrom: self commandLine andAddTo: reporters ]
]
