pipeline {
	environment {
		registry = "ikuku/simple-laravel"
		registryCredential = 'dockerhub'
	}
	agent any
	stages {
		stage('Setup Volume Folders') {
			steps {
				// withCredentials(string(credentialsId: 'kubeconfig', variable: 'kubeconfig')){
					sh 'echo "Starting..."'
					sh 'ls -a'
					sh 'cp .env.example .env'
					sh 'mkdir -p volumes'
					sh 'mkdir -p volumes/logs'
					sh 'mkdir -p volumes/app'
					sh 'kubectl config view'
					sh 'cat $HOME/.kube/config'
					sh 'echo ${kubeconfig}'
				// }
			}
		}
		// stage('Build Docker image') {
		// 	steps {
		// 		script {
		// 			dockerImage = docker.build registry + ":latest"
		// 		}
		// 	}
		// }
		// stage('Deploy Docker image') {
		// 	steps {
		// 		script {
		// 			docker.withRegistry('', registryCredential) {
		// 				dockerImage.push()
		// 			}
		// 		}
		// 	}
		// }

		// stage('Deploy to Cluster') {
		// 	steps {
		// 		// kubernetesDeploy(
		// 		// 	kubeconfigId: 'kubeconfig',
		// 		// 	configs: 'deployment.yaml',
		// 		// 	enableConfigSubstitution: true
		// 		// )
		// 		withCredentials([kubeconfigContent(credentialsId: 'kubeconfig', variable: 'KUBECONFIG')]) {
		// 			sh '''kubectl apply -f deployment.yaml --kubeconfig=${KUBECONFIG}'''
		// 		}
		// 	}
		// }
		// stage('Deploy') {
		// 	steps {
		// 		script {
		// 			def image_id = registry + ":$BUILD_NUMBER"
        //            	sh "ansible-playbook  playbook.yml --extra-vars \"image_id=${image_id}\""
		// 		}
		// 	}
		// }

		// stage('Deploy') {
		// 	steps {
		// 		// sh 'kubectl apply -f deployment.yaml'
		// 		sh 'kubectl create -f ./laravel-controller.json'
		// 		sh 'kubectl describe replicationcontroller/laravel-controller'
		// 		sh 'kubectl create -f ./laravel-service.json'
		// 		sh 'kubectl get pods'
		// 		sh 'kubectl get services'
		// 	}
		// }

		// stage('Run Docker') {
		// 	steps {
		// 		sh 'docker run -d \
		// 		  --name laravel \
		// 		  -v :/var/www \
		// 		  -v /volumes/app:/var/www/storage/app \
		// 		  -v /volumes/logs:/var/www/storage/logs \
		// 		  -p 8888:80 $registry:$BUILD_NUMBER'
		// 		sh 'docker container ls'
		// 	}
		// }
		// stage('Test Web Server') {
		// 	steps {
		// 		sh 'sleep 10s'
		// 		sh 'curl --connect-timeout 5 \
		// 		  --max-time 10 \
		// 		  --retry 5 \
		// 		  --retry-delay 0 \
		// 		  --retry-max-time 40 \
		// 		  0.0.0.0:8888'
		// 	}
		// }
		// stage('Kill container') {
		// 	steps {
		// 		sh 'docker kill laravel'
		// 		sh 'docker rm laravel'
		// 	}
		// }
		// stage('Remove unused Docker image') {
		// 	steps {
		// 		sh 'docker rmi $registry:$BUILD_NUMBER'
		// 	}
		// }
	}
}