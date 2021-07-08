Class {
	#name : #ClassOrganizationAccessingBenchmarks,
	#superclass : #AbstractPharoBenchmarks,
	#category : #Benchmarks
}

{ #category : #benchmarking }
ClassOrganizationAccessingBenchmarks >> benchSystemOrganizerAMiddleItem [
	SystemOrganizer default  numberOfCategoryOfElement: #FLIteratingCluster
]

{ #category : #benchmarking }
ClassOrganizationAccessingBenchmarks >> benchSystemOrganizerANonExistingItem [
	SystemOrganizer default numberOfCategoryOfElement: #Test0NotExistingClass
]

{ #category : #benchmarking }
ClassOrganizationAccessingBenchmarks >> benchSystemOrganizerOneOfFirstItems [
	SystemOrganizer default numberOfCategoryOfElement: #RBParser
]

{ #category : #benchmarking }
ClassOrganizationAccessingBenchmarks >> benchSystemOrganizerOneOfLastItems [
	SystemOrganizer default numberOfCategoryOfElement: #ZnUrl
]

{ #category : #benchmarking }
ClassOrganizationAccessingBenchmarks >> problemSize [

	^ 1000
]
