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
	
	^ { #name -> 'executionTime'. #value -> value. #unit -> unit } asDictionary
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
