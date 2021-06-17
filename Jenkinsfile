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
        stage ("Install SIPP") {
            steps {
                ansiblePlaybook (
                    playbook: '${WORKSPACE}/tuantest-run-sipp.yml',
                    inventory: '${WORKSPACE}/hosts_all_server',
                    tags: 'install-sipp',
                    extraVars: [
                        hostname: [value: '${hostname}', hidden: false],
                        pbx_server_ip: [value: '${pbx_server_ip}', hidden: false],
                        domain_uri: [value: '${domain_uri}', hidden: false],
                        password_extensions: [value: '${password_extensions}', hidden: true],
                        total_calls: [value: '${total_calls}', hidden: false],
                        number_of_calls_per_second: [value: '${number_of_calls_per_second}', hidden: false],
                        calls_duration: [value: '${calls_duration}', hidden: false]
                    ]
                )
            }
        }
        stage ("Copy SIPP file") {
            steps {
                ansiblePlaybook (
                    playbook: '${WORKSPACE}/tuantest-run-sipp.yml',
                    inventory: '${WORKSPACE}/hosts_all_server',
                    tags: 'copy-sipp-file',
                    extraVars: [
                        hostname: [value: '${hostname}', hidden: false],
                        pbx_server_ip: [value: '${pbx_server_ip}', hidden: false],
                        domain_uri: [value: '${domain_uri}', hidden: false],
                        password_extensions: [value: '${password_extensions}', hidden: true],
                        total_calls: [value: '${total_calls}', hidden: false],
                        number_of_calls_per_second: [value: '${number_of_calls_per_second}', hidden: false],
                        calls_duration: [value: '${calls_duration}', hidden: false]
                    ]
                )
            }
        }
        stage ("Run SIPP") {
            steps {
                ansiblePlaybook (
                    playbook: '${WORKSPACE}/tuantest-run-sipp.yml',
                    inventory: '${WORKSPACE}/hosts_all_server',
                    tags: 'run-sipp',
                    extraVars: [
                        hostname: [value: '${hostname}', hidden: false],
                        pbx_server_ip: [value: '${pbx_server_ip}', hidden: false],
                        domain_uri: [value: '${domain_uri}', hidden: false],
                        password_extensions: [value: '${password_extensions}', hidden: true],
                        total_calls: [value: '${total_calls}', hidden: false],
                        number_of_calls_per_second: [value: '${number_of_calls_per_second}', hidden: false],
                        calls_duration: [value: '${calls_duration}', hidden: false]
                    ]
                )
            }
        }
    }
    post {
        always {
            notifyEvents message: '''Build <a href="$PROJECT_URL">$PROJECT_NAME</a>
            Build Number <a href="$BUILD_URL">$BUILD_NUMBER</a> result with status: <b>$BUILD_STATUS</b>
            <a href="$BUILD_URL/console">Build log</a> on host ${hostname}''',
                token: 'zqMYpf7aCt0Wl3T_IMdsh-LOUzf7_G8T'
        }
    }
}
