pipeline {
    agent { label 'master' }
    options {
        ansiColor('vga')
    }
    parameters {
        string(name: 'hostname', defaultValue: '', description: 'Enter your IP server here')
        string(name: 'pbx_server_ip', defaultValue: '', description: 'Enter IP of PBX server here')
        string(name: 'extensions_start'), defaultValue: '', description: 'Enter your starting extensions here')
        string(name: 'extensions_end'), defaultValue: '', description: 'Enter your ending extensions here')
        string(name: 'domain_uri', defaultValue: '', description: 'Enter your tenant name here')
        string(name: 'password_extensions', defaultValue: '', description: 'Enter your password extensions 1 to 100 here')
        string(name: 'total_request', defaultValue: '', description: 'Enter your total number of request here')
        string(name: 'number_of_request_per_second', defaultValue: '', description: 'Enter your number of request per second here')
        string(name: 'request_duration', defaultValue: '', description: 'Enter your duration request here')
        choice(name: 'run_type', choices: ['register+invite', 'register', 'invite'], description: 'Choose how to run SIPP')
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
                        total_request: [value: '${total_request}', hidden: false],
                        number_of_request_per_second: [value: '${number_of_request_per_second}', hidden: false],
                        request_duration: [value: '${request_duration}', hidden: false]
                    ]
                )
            }
        }
        stage ("Copy SIPP file") {
            steps {
                sh 'bash create-csv.sh ${extensions_start} ${extensions_end}'
                ansiblePlaybook (
                    playbook: '${WORKSPACE}/tuantest-run-sipp.yml',
                    inventory: '${WORKSPACE}/hosts_all_server',
                    tags: 'copy-sipp-file',
                    extraVars: [
                        hostname: [value: '${hostname}', hidden: false],
                        pbx_server_ip: [value: '${pbx_server_ip}', hidden: false],
                        extensions_start: [value: '${extensions_start}', hidden: false],
                        extensions_end: [value: '${extensions_end}', hidden: false],
                        domain_uri: [value: '${domain_uri}', hidden: false],
                        password_extensions: [value: '${password_extensions}', hidden: true],
                        total_request: [value: '${total_request}', hidden: false],
                        number_of_request_per_second: [value: '${number_of_request_per_second}', hidden: false],
                        request_duration: [value: '${request_duration}', hidden: false]
                    ]
                )
            }
        }
        stage ("Run SIPP Regsiter and Invite") {
            parallel {
                stage ("Run SIPP Regsiter") {
                    when {
                        expression {
                            params.run_type == 'register+invite' || params.run_type == 'register'
                        }
                    }
                    steps {
                        ansiblePlaybook (
                            playbook: '${WORKSPACE}/tuantest-run-sipp.yml',
                            inventory: '${WORKSPACE}/hosts_all_server',
                            tags: 'run-sipp-register',
                            extraVars: [
                                hostname: [value: '${hostname}', hidden: false],
                                pbx_server_ip: [value: '${pbx_server_ip}', hidden: false],
                                extensions_start: [value: '${extensions_start}', hidden: false],
                                extensions_end: [value: '${extensions_end}', hidden: false],
                                domain_uri: [value: '${domain_uri}', hidden: false],
                                password_extensions: [value: '${password_extensions}', hidden: true],
                                total_request: [value: '${total_request}', hidden: false],
                                number_of_request_per_second: [value: '${number_of_request_per_second}', hidden: false],
                                run_type: [value: '${run_type}', hidden: false]
                            ]
                        )
                    }
                }
                stage ("Run SIPP Invite") {
                    when {
                        expression {
                            params.run_type == 'register+invite' || params.run_type == 'invite'
                        }
                    }
                    steps {
                        ansiblePlaybook (
                            playbook: '${WORKSPACE}/tuantest-run-sipp.yml',
                            inventory: '${WORKSPACE}/hosts_all_server',
                            tags: 'run-sipp-invite',
                            extraVars: [
                                hostname: [value: '${hostname}', hidden: false],
                                pbx_server_ip: [value: '${pbx_server_ip}', hidden: false],
                                extensions_start: [value: '${extensions_start}', hidden: false],
                                extensions_end: [value: '${extensions_end}', hidden: false],
                                domain_uri: [value: '${domain_uri}', hidden: false],
                                password_extensions: [value: '${password_extensions}', hidden: true],
                                total_request: [value: '${total_request}', hidden: false],
                                number_of_request_per_second: [value: '${number_of_request_per_second}', hidden: false],
                                request_duration: [value: '${request_duration}', hidden: false],
                                run_type: [value: '${run_type}', hidden: false]
                            ]
                        )
                    }
                }
            }
        }
    }
    post {
        always {
            // notifyEvents message: '''Tuan is testing
            // Build <a href="$PROJECT_URL">$PROJECT_NAME</a>
            // Build Number <a href="$BUILD_URL">$BUILD_NUMBER</a> result with status: <b>$BUILD_STATUS</b>
            // <a href="$BUILD_URL/console">Build log</a> on host ${hostname}''',
            //     token: 'zqMYpf7aCt0Wl3T_IMdsh-LOUzf7_G8T'

            // emailext subject: 'Jenkins ${BUILD_STATUS} [#${BUILD_NUMBER}] - ${PROJECT_NAME}',
            // body: '''Build <a href="$PROJECT_URL">$PROJECT_NAME</a> <br>
            // Build Number <a href="$BUILD_URL">$BUILD_NUMBER</a> result with status: <b>$BUILD_STATUS</b> <br>
            // <a href="$BUILD_URL/console">Build log</a> on host ${hostname}''',
            // to: 'tech@tel4vn.com'

            telegramSend(message: '''Build [$PROJECT_NAME]($PROJECT_URL) \nBuild Number [$BUILD_NUMBER]($BUILD_URL) result with status: *$BUILD_STATUS* \n[Build log]($BUILD_URL/console) on host ${hostname}''',
            chatId:-535274016)
        }
    }
}
