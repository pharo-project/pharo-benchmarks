Class {
	#name : #AbstractPharoBenchmark,
	#superclass : #SMarkSuite,
	#instVars : [
		'existingClass',
		'existingClassUsingATrait',
		'existingTestTrait'
	],
	#category : #Benchmarks
}

{ #category : #benchmarking }
AbstractPharoBenchmark class >> defaultRunner [

	^ SMarkPragmaRunner 
]

{ #category : #benchmarking }
AbstractPharoBenchmark class >> isAbstract [ 
	
	^ self name = #AbstractPharoBenchmark
]

{ #category : #benchmarking }
AbstractPharoBenchmark class >> iterations [
	^ 10
]

{ #category : #benchmarking }
AbstractPharoBenchmark class >> run [ 

	^ self run: self iterations
]

{ #category : #benchmarking }
AbstractPharoBenchmark >> existingClass [

	^ existingClass ifNil: [ existingClass := Object subclass: self existingClassName
				instanceVariableNames: 'aVar anotherVar anotherAnotherVar'
				classVariableNames: '' 
				package: self testPackageName ]

]

{ #category : #benchmarking }
AbstractPharoBenchmark >> existingClassName [

	^ #AnExistingTestClass
]

{ #category : #benchmarking }
AbstractPharoBenchmark >> existingClassUsingATrait [

	^ existingClassUsingATrait ifNil: [ 	
			existingClassUsingATrait := Object subclass: #ExistingClassUsingATrait
				uses: self existingTestTrait
				instanceVariableNames: 'aVar anotherVar anotherAnotherVar'
				classVariableNames: '' 
				package: self testPackageName ]
]

{ #category : #benchmarking }
AbstractPharoBenchmark >> existingTestTrait [

	^ existingTestTrait
		ifNil: [ existingTestTrait := Trait
				named: #AExistingTestTrait
				uses: {}
				package: self testPackageName ]
]

{ #category : #benchmarking }
AbstractPharoBenchmark >> tearDown [ 
	
	super tearDown.
	existingClass := nil.
	(self testPackageName asPackageIfAbsent: [ ^ self ]) removeFromSystem. 
]

{ #category : #benchmarking }
AbstractPharoBenchmark >> testPackageName [

	^ 'Benchmark-Test-Package'
]
