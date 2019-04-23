# Java
if (`which jrunscipt`); then
    export JAVA_HOME="$(jrunscript -e 'java.lang.System.out.println(java.lang.System.getProperty("java.home"));')"
fi
