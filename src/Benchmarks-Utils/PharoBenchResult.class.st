Class {
	#name : #PharoBenchResult,
	#superclass : #Object,
	#instVars : [
		'measurements',
		'fullGCCount',
		'fullGCTime',
		'incrementalGCCount',
		'incrementalGCTime',
		'compilationTime',
		'compilationCount'
	],
	#category : #'Benchmarks-Utils-Core'
}

{ #category : #adding }
PharoBenchResult >> addMeasurement: anInteger [ 
	
	measurements add: anInteger
]

{ #category : #conversion }
PharoBenchResult >> asDictionary [
	
	^ OrderedDictionary new
		at: 'measurements' put: measurements asArray;
		at: 'full-gc-count' put: fullGCCount;
		at: 'full-gc-time' put: fullGCTime;
		at: 'incremental-gc-count' put: incrementalGCCount;
		at: 'incremental-gc-time' put: incrementalGCTime;
		at: 'compilation-time' put: compilationTime;
		at: 'compilation-count' put: compilationCount;
		yourself
]

{ #category : #accessing }
PharoBenchResult >> compilationCount [

	^ compilationCount
]

{ #category : #accessing }
PharoBenchResult >> compilationCount: anObject [

	compilationCount := anObject
]

{ #category : #accessing }
PharoBenchResult >> compilationTime [

	^ compilationTime
]

{ #category : #accessing }
PharoBenchResult >> compilationTime: anObject [

	compilationTime := anObject
]

{ #category : #accessing }
PharoBenchResult >> fullGCCount [

	^ fullGCCount
]

{ #category : #accessing }
PharoBenchResult >> fullGCCount: anObject [

	fullGCCount := anObject
]

{ #category : #accessing }
PharoBenchResult >> fullGCTime [

	^ fullGCTime
]

{ #category : #accessing }
PharoBenchResult >> fullGCTime: anObject [

	fullGCTime := anObject
]

{ #category : #accessing }
PharoBenchResult >> incrementalGCCount [

	^ incrementalGCCount
]

{ #category : #accessing }
PharoBenchResult >> incrementalGCCount: anObject [

	incrementalGCCount := anObject
]

{ #category : #accessing }
PharoBenchResult >> incrementalGCTime [

	^ incrementalGCTime
]

{ #category : #accessing }
PharoBenchResult >> incrementalGCTime: anObject [

	incrementalGCTime := anObject
]

{ #category : #adding }
PharoBenchResult >> initialize [

	super initialize.
	measurements := OrderedCollection new.
]

{ #category : #accessing }
PharoBenchResult >> measurements [

	^ measurements
]

{ #category : #accessing }
PharoBenchResult >> measurements: anObject [

	measurements := anObject
]
