Class {
	#name : #BenchmarkJSONTest,
	#superclass : #Object,
	#instVars : [
		'name',
		'results'
	],
	#category : #'Benchmarks-Utils-JSON-Output'
}

{ #category : #exporting }
BenchmarkJSONTest >> forExport [
	
	^ { #name -> name. #results -> (results collect: #forExport)  } asDictionary
]

{ #category : #initialization }
BenchmarkJSONTest >> initializeFrom: anAssociation [ 
	
	| average averageResult |
	
	name := anAssociation key.
	
	average := (anAssociation value sumNumbers: [ :e | (e criteria: #total) total ]) / anAssociation value size.
	
	averageResult := BenchmarkJSONResult new
		value: average;
		unit: 'ms';
		yourself.
		
	results := { averageResult }.
]
