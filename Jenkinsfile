properties([
  parameters([
    string(name: 'source_bucket', defaultValue: '', description: ''),
    string(name: 'dest_bucket', defaultValue: '', description: ''),
    string(name: 'prefix', defaultValue: '', description: ''),
    string(name: 'source_region', defaultValue: 'us-gov-west-1', description: ''),
    string(name: 'dest_region', defaultValue: 'us-gov-west-1', description: ''),
    string(name: 'source_endpoint', defaultValue: 'http://s3-us-gov-west-1.amazonaws.com', description: ''),
    string(name: 'dest_endpoint', defaultValue: 'http://s3-us-gov-west-1.amazonaws.com', description: '')
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
            -e dest_region=${params.dest_region} \
            -e source_endpoint=${params.source_endpoint} \
            -e dest_endpoint=${params.dest_endpoint}")
        {
            sh "logstash -f /usr/share/logstash/pipeline/logstash.conf"
        }
    }
}
