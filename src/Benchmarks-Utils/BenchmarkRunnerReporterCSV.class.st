Class {
	#name : #BenchmarkRunnerReporterCSV,
	#superclass : #SMarkSimpleStatisticsReporter,
	#instVars : [
		'csvWriter'
	],
	#category : #'Benchmarks-Utils-CSV-Output'
}

{ #category : #accessing }
BenchmarkRunnerReporterCSV >> outputStream: aStream [
	
	stream := aStream.
	csvWriter := NeoCSVWriter on: stream.

]

{ #category : #accessing }
BenchmarkRunnerReporterCSV >> pharoVersion [

	^ SystemVersion current printString
]

{ #category : #accessing }
BenchmarkRunnerReporterCSV >> report [
	
	| times |

	runner results keysAndValuesDo: [:benchmark :aListOfResults |
			| criteria |

			criteria := aListOfResults first criteria.
			
			criteria keysDo: [:criterion |
				times := self resultsFor: criterion from: aListOfResults.
				csvWriter nextPut: (self reportResult: times for: criterion of: benchmark) ]
	].

]

{ #category : #accessing }
BenchmarkRunnerReporterCSV >> reportResult: results for: aCriterion of: benchmark [
	| confidenceVariance |

	confidenceVariance := results size < 2 
				ifTrue: [ 0 ] 
				ifFalse: [ self confidenceVariance: results ].
	
	^ { self pharoVersion. self vmVersion. runner suite class name. benchmark. aCriterion. results size. results average asFloat. confidenceVariance }
]

{ #category : #accessing }
BenchmarkRunnerReporterCSV >> vmVersion [ 
	
	^ Smalltalk vm version
]

{ #category : #accessing }
BenchmarkRunnerReporterCSV >> writeHeader [

	csvWriter nextPut: #('Pharo Version' 'VM Version' 'Benchmark Class' 'Benchmark' 'Criteria' 'Iterations' 'Average' 'Variance')
]
