properties([disableConcurrentBuilds()])

def runBenchmark(platform, arch){

	stage("${platform}${arch}"){
		node(platform) {
			cleanWs()

			if(params.isPR){
				zipFile = "Pharo*-PR-${arch}bit-*.zip"
			}else{
				zipFile = "Pharo*-SNAPSHOT.build.*.arch.${arch}bit.zip"
			}


			timeout(60) {
				copyArtifacts filter: "bootstrap-cache/${zipFile}", fingerprintArtifacts: true, flatten: true, projectName: env.originProjectName, selector: upstream(fallbackToLastSuccessful: true)

				copyArtifacts filter: "baseline-${platform}${arch}.ston", fingerprintArtifacts: true, optional: true, projectName: 'pharo-benchmarks', selector: lastSuccessful()
				

				sh "wget -O - get.pharo.org/${arch}/vm80 | bash"
				sh "unzip ${zipFile}"
				sh "./pharo Pharo*.image eval --save \"Metacello new baseline: 'Benchmarks'; repository:'github://tesonep/pharo-benchmarks/src'; load\""
				
				sh "./pharo Pharo*.image benchmark \"Benchmarks\" --full-json=${platform}${arch}.json --ston=${platform}${arch}.ston --iterations=10 --previousRun=baseline-${platform}${arch}.ston"

				if(!params.isPR){
					sh "cp ${platform}${arch}.ston baseline-${platform}${arch}.ston"
				}

				archiveArtifacts "${platform}${arch}.json"
				archiveArtifacts "${platform}${arch}.ston"
				archiveArtifacts "baseline-${platform}${arch}.ston"

				stash includes: "${platform}${arch}.json", name: "${platform}${arch}"
			}
		}
	}
}

def notifyBuild(status){

	if(status == 'SUCCESS'){
		message = "The benchmarks do not show regressions."
	}else{
		if(status == 'PENDING'){
			message = "The benchmarks are running."
		}else{
			message = "The benchmarks show regressions."
			status = 'FAILURE'
		}
	}

	url = env.JOB_URL
	commit = env.commit

	githubNotify account: 'pharo-project', context: 'continuous-integration/benchmarks', credentialsId: 'pharo-ci-token', description: message, repo: 'pharo', sha: commit, status: status, targetUrl: url
}
 
stage('starting'){
	node('unix'){
		notifyBuild('PENDING')
	}
} 

runBenchmark('unix', 32)
runBenchmark('unix', 64)
runBenchmark('osx', 32)
runBenchmark('osx', 64)

stage('notification'){
	node('unix'){
	
	    cleanWs()
	    unstash 'unix32'
	    unstash 'osx32'
	    unstash 'unix64'
	    unstash 'osx64'

		try{
			benchmark altInputSchema: '', altInputSchemaLocation: '', inputLocation: '*.json', schemaSelection: 'defaultSchema', truncateStrings: true    
			notifyBuild(currentBuild.currentResult)
		} catch (e){
			notifyBuild(currentBuild.currentResult)
			throw e
		}
	}
}


