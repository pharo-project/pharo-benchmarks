Class {
	#name : #BenchmarkJSONResult,
	#superclass : #Object,
	#instVars : [
		'value',
		'unit'
	],
	#category : #'Benchmarks-Utils'
}

{ #category : #exporting }
BenchmarkJSONResult >> forExport [
	
	^ { #name -> 'executionTime'. #value -> value. #unit -> unit. #thresholds -> self percentageThresholds} asDictionary
]

{ #category : #accessing }
BenchmarkJSONResult >> percentageThresholds [

	^ { 'method' -> 'percentage'. 'percentage' -> '10' } asDictionary 
]

{ #category : #accessing }
BenchmarkJSONResult >> unit [
	^ unit
]

{ #category : #accessing }
BenchmarkJSONResult >> unit: anObject [
	unit := anObject
]

{ #category : #accessing }
BenchmarkJSONResult >> value [
	^ value
]

{ #category : #accessing }
BenchmarkJSONResult >> value: anObject [
	value := anObject
]
