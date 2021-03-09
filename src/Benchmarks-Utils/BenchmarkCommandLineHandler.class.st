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
	| className selector class runner suite incrementalGCCountBefore incrementalGCTimeBefore fullGCCountBefore fullGCTimeBefore result incrementalGCCountAfter incrementalGCTimeAfter fullGCCountAfter fullGCTimeAfter output outputFile iterations problemSize outputFileName |

	self activateHelp ifTrue: [ ^ self ].
	
	className := self argumentAt: 1.
	selector := self argumentAt: 2.
	iterations := self optionAt: 'iterations'
		ifPresent: [ :iterationString | iterationString asNumber ]
		ifAbsent: [ nil ].
	problemSize := self optionAt: 'problemSize'
		ifPresent: [ :problemSizeString | problemSizeString asNumber ]
		ifAbsent: [ nil ].
	outputFileName := self optionAt: 'out' ifAbsent: [ 'out.json' ].
	
	class := Smalltalk globals at: className.
	
	runner := SMarkRunner new.
	suite := class new.
	suite runOnly: selector.

	runner suite: suite.
	runner iterations: iterations.
	runner problemSize: problemSize.

	incrementalGCCountBefore := Smalltalk vm incrementalGCCount.
	incrementalGCTimeBefore := Smalltalk vm totalIncrementalGCTime.
	fullGCCountBefore := Smalltalk vm fullGCCount.
	fullGCTimeBefore := Smalltalk vm totalFullGCTime.
		result := runner execute.
	incrementalGCCountAfter := Smalltalk vm incrementalGCCount.
	incrementalGCTimeAfter := Smalltalk vm totalIncrementalGCTime.
	fullGCCountAfter := Smalltalk vm fullGCCount.
	fullGCTimeAfter := Smalltalk vm totalFullGCTime.
	
	output := Dictionary new.
	output at: 'results' put: (result anyOne collect: #total) asArray.
	output at: 'vm-stats' put: { 
		'full-gc-count' -> (fullGCCountAfter - fullGCCountBefore).
		'full-gc-time' -> (fullGCTimeAfter - fullGCTimeBefore).
		'incremental-gc-count' -> (incrementalGCCountAfter - incrementalGCCountBefore).
		'incremental-gc-time' -> (incrementalGCTimeAfter - incrementalGCTimeBefore).
	 } asDictionary.
	
	outputFile := FileSystem workingDirectory / outputFileName.
	outputFile
		ensureDelete;
		writeStreamDo: [ :stream | STON put: output asJsonOnStream: stream ].
	
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
