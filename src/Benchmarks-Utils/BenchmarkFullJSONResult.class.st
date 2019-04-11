Class {
	#name : #BenchmarkFullJSONResult,
	#superclass : #Object,
	#instVars : [
		'test',
		'value',
		'unit'
	],
	#category : #'Benchmarks-Utils-Output'
}

{ #category : #accessing }
BenchmarkFullJSONResult >> benchmarkClassName [
	
	^ test group name asSymbol
]

{ #category : #accessing }
BenchmarkFullJSONResult >> compareWithPrevious [

	| listOfResults previousTime |

	listOfResults := test group previousResultFor: self.

	listOfResults ifNil: [ ^ {} ].

	previousTime := (listOfResults collect: #total) average.

	(previousTime * 1.1 < self value)
		ifFalse: [ ^ {} ].

	^ {{ 'method' -> 'absolute'. 'maximum' -> (previousTime * 1.1) asFloat floor } asDictionary }
]

{ #category : #exporting }
BenchmarkFullJSONResult >> forExport [
	
	^ { #name -> self name. #value -> value. #unit -> unit. #thresholds -> self compareWithPrevious} asDictionary
]

{ #category : #exporting }
BenchmarkFullJSONResult >> name [

	^ OSPlatform current family , self platformArchitecture
]

{ #category : #exporting }
BenchmarkFullJSONResult >> platformArchitecture [

	^ (Smalltalk wordSize * 8) asString
]

{ #category : #accessing }
BenchmarkFullJSONResult >> test: aBenchmarkFullJSONTest [ 
	test := aBenchmarkFullJSONTest
]

{ #category : #accessing }
BenchmarkFullJSONResult >> testName [
	
	^ test name
]

{ #category : #accessing }
BenchmarkFullJSONResult >> unit [
	^ unit
]

{ #category : #accessing }
BenchmarkFullJSONResult >> unit: anObject [
	unit := anObject
]

{ #category : #accessing }
BenchmarkFullJSONResult >> value [
	^ value
]

{ #category : #accessing }
BenchmarkFullJSONResult >> value: anObject [
	value := anObject
]
