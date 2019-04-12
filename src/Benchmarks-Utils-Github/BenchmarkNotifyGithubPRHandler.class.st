Class {
	#name : #BenchmarkNotifyGithubPRHandler,
	#superclass : #CommandLineHandler,
	#instVars : [
		'token',
		'testing',
		'github',
		'commit',
		'state',
		'owner',
		'repository',
		'description',
		'url',
		'context'
	],
	#category : #'Benchmarks-Utils-Github'
}

{ #category : #accessing }
BenchmarkNotifyGithubPRHandler class >> commandName [

	^ 'NotifyGithub'
]

{ #category : #accessing }
BenchmarkNotifyGithubPRHandler class >> description [

	^ 'Updates the PR passed as parameter using the Token found in the environment variable called gitToken'
]

{ #category : #activation }
BenchmarkNotifyGithubPRHandler >> activate [
	
	| request |
	self validateParameters.
	
	github := Github new.
	github loginToken: token.
	
	request := GHPostCommitStatus new.
	request state: state.
	request owner: owner.
	request repository: repository.
	request description: description.
	request statusURL: url.
	request context: context.
	request commit: commit.

	github call: request.
]

{ #category : #activation }
BenchmarkNotifyGithubPRHandler >> beTesting [

	testing := true
]

{ #category : #activation }
BenchmarkNotifyGithubPRHandler >> exitSuccess [

	self isTesting
		ifFalse: [ super exitSuccess ]
]

{ #category : #activation }
BenchmarkNotifyGithubPRHandler >> isTesting [

	^ testing ifNil: [ false ]
]

{ #category : #arguments }
BenchmarkNotifyGithubPRHandler >> retrieveToken [
	
	^ Smalltalk os environment at: 'gitToken'
]

{ #category : #activation }
BenchmarkNotifyGithubPRHandler >> validateParameters [

	token := self retrieveToken.
	
	commit := self commandLine optionAt: 'commit'.
	state := self commandLine optionAt: 'state'.
	owner := self commandLine optionAt: 'owner'.
	repository := self commandLine optionAt: 'repository'.
	description := self commandLine optionAt: 'description'.
	url := self commandLine optionAt: 'url'.
	context := self commandLine optionAt: 'context'.

]
