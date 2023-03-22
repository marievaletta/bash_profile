export QUARKUS_HTTP_PORT=8090
export NODE_EXTRA_CA_CERTS=~/Downloads/sb1a-root-ca.cer
export AWS_PROFILE_BSF=077677634921_bsfmeglersys-preprod-developer

J17_HOME=/Users/a50508z/Library/Java/JavaVirtualMachines/corretto-17.0.4/Contents/Home
J11_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home

alias j17_mvn="JAVA_HOME=$J17_HOME mvn"
alias j11_mvn="JAVA_HOME=$J11_HOME mvn"

export JAVA_HOME="$J17_HOME"

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
  else
    echo "Current AWS env: $current_aws"
  fi
}

function leveranse() {
    filnavn=$1
    curl_params=$2
    curl $curl_params -H 'X-Requested-With: curl' --negotiate --user : -F uploadfile="@$filnavn" https://leveransemottak.intern.sparebank1.no/api/v1/upload-app\?authmethod\=kerberos
}

