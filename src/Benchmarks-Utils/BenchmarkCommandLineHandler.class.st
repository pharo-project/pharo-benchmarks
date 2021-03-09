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
	| className selector class runner result iterations problemSize benchmark |

	self activateHelp ifTrue: [ ^ self ].
	
	className := self benchmarkClassName.
	selector := self selector.
	iterations := self iterations.
	problemSize := self problemSize.
	
	class := Smalltalk globals at: className.
	
	benchmark := class benchmarkForSelector: selector.
	
	runner := PharoSMarkRunner new.
	runner suite: benchmark.
	runner iterations: iterations.
	runner problemSize: problemSize.

	result := benchmark runOn: runner.
	
	self outputFileReference
		ensureDelete;
		writeStreamDo: [ :stream | STON put: result asDictionary asJsonOnStream: stream ].
	
	self exitSuccess 
	
]

{ #category : #'as yet unclassified' }
BenchmarkCommandLineHandler >> beTesting [

	testing := true
]

{ #category : #accessing }
BenchmarkCommandLineHandler >> benchmarkClassName [
	
	^ (self argumentAt: 1) asSymbol
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
	
	^ self optionAt: 'iterations'
		ifPresent: [ :iterationString | iterationString asNumber ]
		ifAbsent: [ nil ]
]

{ #category : #accessing }
BenchmarkCommandLineHandler >> outputFileName [
	
	^ self optionAt: 'out' ifAbsent: [ 'out.json' ]
]

{ #category : #accessing }
BenchmarkCommandLineHandler >> outputFileReference [
	
	^ FileSystem workingDirectory resolve: self outputFileName 
]

{ #category : #activation }
BenchmarkCommandLineHandler >> problemSize [

	^ self optionAt: 'problemSize'
		ifPresent: [ :problemSizeString | problemSizeString asNumber ]
		ifAbsent: [ nil ]
]

{ #category : #accessing }
BenchmarkCommandLineHandler >> selector [
	
	^ (self argumentAt: 2) asSymbol
]
