pipeline {
    agent { label 'master' }
    options {
        ansiColor('vga')
    }
    parameters {
        string(name: 'hostname', defaultValue: '', description: 'Enter your IP server here')
        string(name: 'pbx_server_ip', defaultValue: '', description: 'Enter IP of PBX server here')
        string(name: 'domain_uri', defaultValue: '', description: 'Enter your tenant name here')
        string(name: 'password_extensions', defaultValue: '', description: 'Enter your password extensions 1 to 100 here')
        string(name: 'total_calls', defaultValue: '', description: 'Enter your total number of calls here')
        string(name: 'number_of_calls_per_second', defaultValue: '', description: 'Enter your number of calls per second here')
        string(name: 'calls_duration', defaultValue: '', description: 'Enter your duration calls here')
    }
    stages {
        stage ("Loadtest using SIPP") {
            steps {
                sh 'ansible-playbook tuantest-run-sipp.yml -i hosts_all_server -e hostname=${hostname} -e pbx_server_ip=${pbx_server_ip} -e domain_uri=${domain_uri} -e password_extensions=${password_extensions} -e total_calls=${total_calls} -e number_of_calls_per_second=${number_of_calls_per_second} -e calls_duration=${calls_duration}'
            }
        }
    }
    post {
        always {
            notifyEvents message: '''Build <a href="$PROJECT_URL">$PROJECT_NAME</a>
            Build Number <a href="$BUILD_URL">$BUILD_NUMBER</a> result with status: <b>$BUILD_STATUS</b>
            <a href="$BUILD_URL/console">Build log</a>''',
                token: 'zqMYpf7aCt0Wl3T_IMdsh-LOUzf7_G8T'
        }
    }
}
