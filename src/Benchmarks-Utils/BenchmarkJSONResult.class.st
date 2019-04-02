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

{ #category : #initialization }
BenchmarkJSONResult >> initializeFrom: aSMarkResult [ 
	
	value := aSMarkResult total.
	unit := 'ms'.
]
