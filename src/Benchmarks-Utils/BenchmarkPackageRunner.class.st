Class {
	#name : #BenchmarkPackageRunner,
	#superclass : #Object,
	#instVars : [
		'package',
		'numberOfIterations'
	],
	#category : #'Benchmarks-Utils-Core'
}

{ #category : #running }
BenchmarkPackageRunner class >> forPackage: aPackage [

	^ self new
		package: aPackage
]

{ #category : #accessing }
BenchmarkPackageRunner >> benchClasses [
	
	^ package classes select: [ :aClass | (aClass includesBehavior: SMarkSuite) and: [ aClass isAbstract not ] ]
]

{ #category : #accessing }
BenchmarkPackageRunner >> iterations: anInteger [ 
	
	numberOfIterations := anInteger
]

{ #category : #accessing }
BenchmarkPackageRunner >> package: aRPackage [ 
	
	package := aRPackage
]

{ #category : #executing }
BenchmarkPackageRunner >> run [
	
	^ self benchClasses collect: [ :aBenchClass | 
			SMarkPragmaRunner new
				suite: aBenchClass new;
				iterations: numberOfIterations;
				execute;
				yourself ]
]
