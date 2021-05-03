

#!/bin/sh
# This is a comment!
echo Hello World        # This is a comment, too!

oc login 

oc new-project poc-dev

oc process openshift//jenkins-ephemeral | oc apply -f- -n poc-dev

oc set env dc/jenkins JENKINS_JAVA_OVERRIDES=-Dhudson.model.DirectoryBrowserSupport.CSP='' INSTALL_PLUGINS=ansicolor:0.5.2 -n poc-dev


oc process -f applier/templates/infra-build.yaml -p NAMESPACE=poc-dev| oc apply -f- -n poc-dev

