Class {
	#name : #BenchmarkFullJSONTest,
	#superclass : #Object,
	#instVars : [
		'group',
		'name',
		'results'
	],
	#category : #'Benchmarks-Utils-Output'
}

{ #category : #exporting }
BenchmarkFullJSONTest >> forExport [
	
	^ { #name -> name. #results -> (results collect: #forExport)  } asDictionary
]

{ #category : #accessing }
BenchmarkFullJSONTest >> group [
	^ group
]

{ #category : #accessing }
BenchmarkFullJSONTest >> group: aBenchmarkFullJSONGroup [ 
	group := aBenchmarkFullJSONGroup
]

{ #category : #initialization }
BenchmarkFullJSONTest >> initializeFrom: anAssociation [ 
	
	| average averageResult |
	
	name := anAssociation key.
	
	average := (anAssociation value sumNumbers: [ :e | (e criteria: #total) total ]) / anAssociation value size.
	
	averageResult := BenchmarkFullJSONResult new
		value: average;
		unit: 'ms';
		test: self;
		yourself.
		
	results := { averageResult }.
]

{ #category : #accessing }
BenchmarkFullJSONTest >> name [
	^ name
]
