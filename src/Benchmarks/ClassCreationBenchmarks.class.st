Class {
	#name : #ClassCreationBenchmarks,
	#superclass : #AbstractPharoBenchmark,
	#category : #Benchmarks
}

{ #category : #benchmarking }
ClassCreationBenchmarks >> benchAddingAnInstanceVariableToAClassWithASubclass [

	<problemSize: 4000>

	| instances |
	self existingClass subclass: #ATestSubClass
		instanceVariableNames: ''
		classVariableNames: ''
		package: self testPackageName.

	instances := (1 to: 500) collect: [ :i | 
		self existingClass new
			instVarAt: 1 put: 1;
			instVarAt: 2 put: 2;
			instVarAt: 3 put: 3;
			yourself].
		
	instances := instances , ((1 to: 500) collect: [ :i | 
		(self class environment classNamed: #ATestSubClass) new
			instVarAt: 1 put: 1;
			instVarAt: 2 put: 2;
			instVarAt: 3 put: 3;
			yourself]).

	Object subclass: self existingClassName
		instanceVariableNames: 'aVar anotherVar anotherAnotherVar newInstVar'
		classVariableNames: '' 
		package: self testPackageName.

]

{ #category : #benchmarking }
ClassCreationBenchmarks >> benchAddingAnInstanceVariableToAClassWithASubclassAndInstances [

	<problemSize: 4000>

	self existingClass subclass: #ATestSubClass
		instanceVariableNames: ''
		classVariableNames: ''
		package: self testPackageName.

	Object subclass: self existingClassName
		instanceVariableNames: 'aVar anotherVar anotherAnotherVar newInstVar'
		classVariableNames: '' 
		package: self testPackageName.

]

{ #category : #benchmarking }
ClassCreationBenchmarks >> benchAddingAnInstanceVariableToAClassWithoutASubclassAndInstances [

	<problemSize: 4000>

	| instances |

	instances := 1 to: 1000 do: [ :i | 
		self existingClass new
			instVarAt: 1 put: 1;
			instVarAt: 2 put: 2;
			instVarAt: 3 put: 3;
			yourself].

	Object subclass: self existingClassName
		instanceVariableNames: 'aVar anotherVar anotherAnotherVar newInstVar'
		classVariableNames: '' 
		package: self testPackageName.

]

{ #category : #benchmarking }
ClassCreationBenchmarks >> benchAddingAnInstanceVariableToAClassWithoutSubclasses [

	<problemSize: 4000>

	Object subclass: self existingClassName
		instanceVariableNames: 'aVar anotherVar anotherAnotherVar newInstVar'
		classVariableNames: '' 
		package: self testPackageName.

]

{ #category : #benchmarking }
ClassCreationBenchmarks >> benchClassAndSubclassCreation [

	| aClass |

	aClass := self existingClass.

	aClass subclass: #ATestSubClass
		instanceVariableNames: ''
		classVariableNames: '' 
		package: self testPackageName

]

{ #category : #benchmarking }
ClassCreationBenchmarks >> benchClassUsingATrait [

	Object subclass: #ATestClass
		uses: self existingTestTrait
		instanceVariableNames: 'aVar anotherVar anotherAnotherVar'
		classVariableNames: '' 
		package: self testPackageName

]

{ #category : #benchmarking }
ClassCreationBenchmarks >> benchSimpleClassCreation [

	<problemSize: 4000>

	Object subclass: #ATestClass
		instanceVariableNames: 'aVar anotherVar anotherAnotherVar'
		classVariableNames: '' 
		package: self testPackageName

]

{ #category : #benchmarking }
ClassCreationBenchmarks >> benchTraitCreation [

	Trait named: #ATestTrait uses: {} package: self testPackageName
]

{ #category : #benchmarking }
ClassCreationBenchmarks >> benchTraitCreationUsingOtherTrait [

	Trait named: #ATestTrait uses: self existingTestTrait package: self testPackageName
]

{ #category : #benchmarking }
ClassCreationBenchmarks >> problemSize [

	^ 100
]
