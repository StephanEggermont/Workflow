Class {
	#name : #BaselineOfWorkflow,
	#superclass : #BaselineOf,
	#category : #BaselineOfWorkflow
}

{ #category : #loading }
BaselineOfWorkflow class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'Workflow' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfWorkflow >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'Workflow'.
			spec package: 'Workflow'
		]
]
