Class {
	#name : #PharoSMarkRunner,
	#superclass : #SMarkRunner,
	#instVars : [
		'incrementalGCCountBefore',
		'incrementalGCTimeBefore',
		'fullGCCountBefore',
		'fullGCTimeBefore',
		'incrementalGCCountAfter',
		'incrementalGCTimeAfter',
		'fullGCCountAfter',
		'fullGCTimeAfter'
	],
	#category : #'Benchmarks-Utils-Core'
}

{ #category : #execution }
PharoSMarkRunner >> currentResult [

	^ results
		at: (suite benchmarkNameForSelector: currentBenchmark)
		ifAbsentPut: [ PharoBenchResult new ]
]

{ #category : #statistics }
PharoSMarkRunner >> fullGCCount [
	
	^ fullGCCountAfter - fullGCCountBefore
]

{ #category : #statistics }
PharoSMarkRunner >> fullGCTime [
	
	^ fullGCTimeAfter - fullGCTimeBefore 
]

{ #category : #statistics }
PharoSMarkRunner >> incrementalGCCount [
	
	^ incrementalGCCountAfter - incrementalGCCountBefore 
]

{ #category : #statistics }
PharoSMarkRunner >> incrementalGCTime [
	
	^ incrementalGCTimeAfter - incrementalGCTimeBefore 
]

{ #category : #execution }
PharoSMarkRunner >> postBenchmark [

	incrementalGCCountAfter := Smalltalk vm incrementalGCCount.
	incrementalGCTimeAfter := Smalltalk vm totalIncrementalGCTime.
	fullGCCountAfter := Smalltalk vm fullGCCount.
	fullGCTimeAfter := Smalltalk vm totalFullGCTime.
	
	self currentResult
		fullGCCount: self fullGCCount;
		fullGCTime: self fullGCTime;
		incrementalGCCount: self incrementalGCCount;
		incrementalGCTime: self incrementalGCTime.

	super postBenchmark.
]

{ #category : #execution }
PharoSMarkRunner >> preBenchmark [

	super preBenchmark.
	incrementalGCCountBefore := Smalltalk vm incrementalGCCount.
	incrementalGCTimeBefore := Smalltalk vm totalIncrementalGCTime.
	fullGCCountBefore := Smalltalk vm fullGCCount.
	fullGCTimeBefore := Smalltalk vm totalFullGCTime.
]

{ #category : #execution }
PharoSMarkRunner >> recordResults: timer for: aSelector [

	self currentResult addMeasurement: timer totalTime.
]
