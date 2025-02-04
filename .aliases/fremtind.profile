export QUARKUS_HTTP_PORT=8090
export AWS_PROFILE_BSF=077677634921_bsfmeglersys-preprod-developer
export FREMTIND_GITHUB_TOKEN=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

alias bsfweb_backend="java -jar ~/code/fremtind/bsf-web/backend/api/target/bsf-web-*.jar --spring.profiles.active=DEV"
alias bsfweb_backend_build="cd ~/code/fremtind/bsf-web/backend/api && mvn clean install -Dmaven.test.skip=true"
alias bsfweb_frontend="cd ~/code/fremtind/bsf-web/frontend && pnpm dev"

alias ivit-token="/Users/marie.frogner/code/fremtind/bsf-ivit-entrypoint/scripts/openid-token.sh fremtind-portveien-bsf-epost-client d1394bc2-d220-4771-bbdd-3ddbf83efad7 | pbcopy"

alias k="kubectl"

function awsenv() {
  #
  # Setup første gang:
  # - Logg inn på Fremtind AWS (se https://github.com/fremtind/bsf-web#deployment-to-aws). Kopier så ~/.aws til ~/.aws.fremtind.
  # - Slett ~/.aws mappen og logg inn på sb1u AWS med `bob aws login`. Kopier så ~/.aws til ~/.aws.sb1u.
  # - Skriv nåværende miljø inn i ~/.aws.current
  # 

  awsenv=$1
  current_aws=$(cat ~/.aws.current)

  if [[ "$awsenv" = "sb1u" ]]; then
    rm -rf ~/.aws
    cp -r ~/.aws.sb1u ~/.aws
    echo "sb1u" > ~/.aws.current
  elif [[ "$awsenv" = "fremtind" ]]; then
    rm -rf ~/.aws
    cp -r ~/.aws.fremtind ~/.aws
    echo "fremtind" > ~/.aws.current
  elif [[ "$awsenv" = "bsf-innsikt" ]]; then
    rm -rf ~/.aws
    cp -r ~/.aws.bsf-innsikt ~/.aws
    echo "bsf-innsikt" > ~/.aws.current
  elif [[ "$awsenv" = "clean" ]]; then
    rm -rf ~/.aws
    echo "none" > ~/.aws.current
  else
    echo "Current AWS env: $current_aws"
  fi
}

podlogs () {
	kubectl logs --follow $1 | grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox} '^{' | jq
}

function podshell() {
	kubectl exec --stdin --tty $1 -- /bin/bash
}
