Class {
	#name : #AbstractPharoBenchmark,
	#superclass : #SMarkSuite,
	#category : #Benchmarks
}

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

	^ self class environment at: self existingClassName ifAbsent: [ 	
			Object subclass: self existingClassName
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

	^ self class environment at: self existingClassName ifAbsent: [ 	
			Object subclass: #ExistingClassUsingATrait
				uses: self existingTestTrait
				instanceVariableNames: 'aVar anotherVar anotherAnotherVar'
				classVariableNames: '' 
				package: self testPackageName ]
]

{ #category : #benchmarking }
AbstractPharoBenchmark >> existingTestTrait [

	^ self class environment 
		at: #AExistingTestTrait 
		ifAbsent: [ 	Trait named: #AExistingTestTrait uses: {} package: self testPackageName ]
]

{ #category : #benchmarking }
AbstractPharoBenchmark >> tearDown [ 
	
	(self testPackageName asPackageIfAbsent: [ ^ self ]) removeFromSystem. 
]

{ #category : #benchmarking }
AbstractPharoBenchmark >> testPackageName [

	^ 'Benchmark-Test-Package'
]
