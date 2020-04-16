properties([
  parameters([
     string(name: 'source_bucket', defaultValue: '', description: ''),
     string(name: 'dest_bucket', defaultValue: '', description: ''),
     string(name: 'prefix', defaultValue: '', description: ''),
     string(name: 'source_region', defaultValue: 'us-gov-west-1', description: ''),
     string(name: 'dest_region', defaultValue: 'us-gov-west-1', description: '')
  ])
])

node("matviews") {
    deleteDir()

    stage ('Checkout') {
        scmVars = checkout scm
    }

    stage('Test') {
        sh "docker build . -t logstashcustom:latest"

        docker.image('logstashcustom').inside(
            "--entrypoint '' \
            -e source_bucket=${params.source_bucket} \
            -e dest_bucket=${params.dest_bucket} \
            -e prefix=${params.prefix} \
            -e source_region=${params.source_region} \
            -e dest_region=${params.dest_region}")  
        {
            sh "logstash"
        }
    }
}
