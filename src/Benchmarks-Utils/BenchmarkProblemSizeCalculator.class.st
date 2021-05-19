Class {
	#name : #BenchmarkProblemSizeCalculator,
	#superclass : #Object,
	#instVars : [
		'minimalTimeToRun',
		'benchmarks'
	],
	#category : #'Benchmarks-Utils-Core'
}

{ #category : #'as yet unclassified' }
BenchmarkProblemSizeCalculator class >> full [

	"Create a convenience calculator that takes most of the running benchmarks in the suite and uses 300ms as the minimal observable time"

	^ self new
		benchmarks: {
		"Macro Benchmarks"
		BenchmarkGameSuite>>#benchKNucleotide.
		BenchmarkGameSuite>>#benchMeteor.
		BenchmarkGameSuite>>#benchChameneosRedux.
		BenchmarkGameSuite>>#benchPiDigits.
		BenchmarkGameSuite>>#benchReverseComplement.
		BenchmarkGameSuite>>#benchFasta.
		BenchmarkGameSuite>>#benchRegexDNA.
		BenchmarkGameSuite>>#benchThreadRing.
		BenchmarkGameSuite>>#benchMandelbrot.
		"BenchmarkGameSuite>>#benchBinaryTrees."
		BenchmarkGameSuite>>#benchFannkuchRedux.
		BenchmarkGameSuite>>#benchSpectralNorm.
		BenchmarkGameSuite>>#benchChameleons.
		BenchmarkGameSuite>>#benchNBody.
		SMarkDeltaBlue>>#benchDeltaBlue.
		SMarkRichards>>#benchRichards.
		SMarkCompiler>>#benchCompiler.
		
		"Mid-sized"
		CodeLayoutBenchmarks>>#benchSmallFactorial.
		CodeLayoutBenchmarks>>#benchLargeFactorial.
		CodeLayoutBenchmarks>>#benchVeryLargeFactorial.
		SMarkSmopstone>>#benchStone.
		SMarkSlopstone>>#benchStone.

		"Micro Loops"
		SMarkLoops>>#benchArrayAccess.
		SMarkLoops>>#benchIntLoop.
		SMarkLoops>>#benchClassVarBinding.
		SMarkLoops>>#benchSendWithManyArguments.
		SMarkLoops>>#benchFloatLoop.
		SMarkLoops>>#benchSend. 
		SMarkLoops>>#benchInstVarAccess.
		
		"Micro Control Flow"
		CodeLayoutBenchmarks>>#benchSequenceOfFalseConditionalBranches.
		CodeLayoutBenchmarks>>#benchSequenceOfFalseConditionalWithCompensation.
		CodeLayoutBenchmarks>>#benchSequenceOfFalseFallthroughs.
		CodeLayoutBenchmarks>>#benchSequenceOfTrueConditionalBranches.
		CodeLayoutBenchmarks>>#benchSequenceOfTrueConditionalWithCompensation.
		CodeLayoutBenchmarks>>#benchSequenceOfTrueFallThroughs.
	};
	minimalTimeToRun: 300;
	yourself
]

{ #category : #'as yet unclassified' }
BenchmarkProblemSizeCalculator class >> outputFullTo: aFileReference [

	self full
		compute;
		writeTo: aFileReference asFileReference
]

{ #category : #accessing }
BenchmarkProblemSizeCalculator >> benchmarks [

	^ benchmarks
]

{ #category : #accessing }
BenchmarkProblemSizeCalculator >> benchmarks: anObject [

	benchmarks := anObject
]

{ #category : #accessing }
BenchmarkProblemSizeCalculator >> compute [

	"Iterate the benchmarks looking for the minimal problem size that would yield times to run above a certain treshold"
	
	| results |
	results := OrderedCollection new.
	benchmarks do: [ :e | | problemSize lastTimeToRun |
		
		[problemSize := 1.
		lastTimeToRun := 0.
		[ lastTimeToRun < minimalTimeToRun ] whileTrue: [
			problemSize := problemSize * 10.
			lastTimeToRun := [
				e methodClass defaultRunner
					execute: (e methodClass new runOnly: e selector)
					problemSize: problemSize
			] timeToRunWithoutGC
		].
	
		results add: {e name. problemSize . lastTimeToRun}]
			on: Error do: [ :error | 
				results add: {e name. problemSize . lastTimeToRun . error }] ].
	^ results
]

{ #category : #accessing }
BenchmarkProblemSizeCalculator >> initialize [

	super initialize.
	benchmarks := #().
	minimalTimeToRun  := 10 "milliseconds".
]

{ #category : #accessing }
BenchmarkProblemSizeCalculator >> minimalTimeToRun [

	^ minimalTimeToRun
]

{ #category : #accessing }
BenchmarkProblemSizeCalculator >> minimalTimeToRun: anObject [

	minimalTimeToRun := anObject
]

{ #category : #accessing }
BenchmarkProblemSizeCalculator >> writeTo: aFileReference [

	"Serialize my data as a CSV using tabs as separator"
	aFileReference asFileReference writeStreamDo: [ :stream |
		stream
			nextPutAll: 'name';
			tab;
			nextPutAll: 'problemSize';
			tab;
			nextPutAll: 'timeToRun';
			tab;
			nextPutAll: 'error';
			crlf.
	
		self compute do: [ :each |
			each do: [ :value |
				stream nextPutAll: value asString
			] separatedBy: [ stream tab ].
			stream crlf ] ]
]
