@rem *************************************************************************
@rem This script deploys rapids-server.ear into WebLogic Server.
@rem It sets the following variables:
@rem
@rem JAVA_HOME  - Root directory of the JDK installation
@rem JAVA_BIN   - Directory of the Java binaries
@rem WL_HOME    - Root directory of the WebLogic installation
@rem CP         - Sets the WebLogic jar to the classpath
@rem URL        - Listen address and listen port of the Administration Server
@rem UN         - Administrator username
@rem PW         - Administrator password
@rem TARGET     - Targets on which to distribute and deploy the application or
@rem              module
@rem NAME       - Deployment name to assign to the deployed application or
@rem              module
@rem SOURCE     - Archive file or exploded archive directory to deploy
@rem
@rem For more information, refer to https://docs.oracle.com/cd/E24329_01/web.1211/e24443/wldeployer.htm#DEPGD318
@rem *************************************************************************

@echo off

setlocal

set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_291
set JAVA_BIN=%JAVA_HOME%\bin
set WLS_HOME=C:\BT\weblogic\wlserver
set CP=%WLS_HOME%\server\lib\weblogic.jar
set URL=t3://192.168.1.6:7001
set UN=weblogic
set PW=weblogic1
set TARGET=server1
set NAME=ngspringboot-0.1-SNAPSHOT
set SOURCE=C:/BT/works/angular-springboot-parent/ngspringboot/target/%NAME%.war

echo Undeploying %NAME% 
"%JAVA_BIN%\java" -cp %CP% weblogic.Deployer -adminurl %URL% -username %UN% -password %PW% -name %NAME% -targets %TARGET% -undeploy

echo Deploying %NAME% 
"%JAVA_BIN%\java" -cp %CP% weblogic.Deployer -adminurl %URL% -username %UN% -password %PW% -name %NAME% -targets %TARGET% -source %SOURCE% -deploy

endlocal