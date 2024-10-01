@echo off
set REQUIRED_VERSION=2.9.0
for /f "tokens=3 USEBACKQ" %%F in (`git --version`) do (
  set GIT_VERSION=%%F
)
node -e " var semver = require('semver'); var gitVersion = '%GIT_VERSION%'; gitVersion = gitVersion.split('.').slice(0, 3).join('.'); if(semver.gte(gitVersion, '%REQUIRED_VERSION%')) {console.log('Git version is greater than or equal to %REQUIRED_VERSION% (%GIT_VERSION%)\n-- FAILING CHECK In order to install git hooks'); process.exit(1);} else {console.log('Git version is less than %REQUIRED_VERSION% (%GIT_VERSION%)\n-- Unable to install git hooks');}"