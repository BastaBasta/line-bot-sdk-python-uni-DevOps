pipeline {
    agent any
    environment {
        MAJOR_VERSION = "1"
        MINOR_VERSION = "1"
        BUILD_VERSION = sh(returnStdout: true, script: 'echo ${BUILD_NUMBER}').trim()
        VERSION = "${MAJOR_VERSION}.${MINOR_VERSION}.${BUILD_VERSION}"
    }
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t Dockerfile.app -f . > ./build_log.txt'
            post {
                always{
                    archiveArtifacts(artifacts: 'build_log*.txt', fingerprint: true, followSymlinks: false)
                }
		        success {
		            echo 'True'
		        }
		        failure {
		            echo 'False'
		        }
            	}
            }
        }
        stage('Test') {
            steps {
                sh 'docker build -t Dockerfile.test -f . > ./test_log.txt'
            post {
                always{
                    archiveArtifacts(artifacts: 'test_log*.txt', fingerprint: true, followSymlinks: false)
                }
		        success {
		            echo 'True'
		        }
		        failure {
		            echo 'False'
		        }
            	}
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker build -t Dockerfile.deploy -f . > ./deploy_log.txt'
            post {
                always{
                    archiveArtifacts(artifacts: 'deploy_log*.txt', fingerprint: true, followSymlinks: false)
                }
                success {
                    echo 'True'
                }
                failure {
                    echo 'False'
                }
            }
        }
    }


}
