# CFML REST Presentation
Slides, code and docker images used with the CFML REST presentation being given to the Hawaii CFUG in Jan 2023.

### Docker Information
To follow along in this presentation :
 - clone this repository using GIT
 - use the `docker compose up`  to download and run all the services to follow along.
   - Docker Compose will download the latest Lucee CFML engine, MariaDB and expose port tcp/80 (http) and tcp/443 (https)
   - Passwords for lucee admin and MariaDB can be found in the secrets files.
   - _These examples include unsecured code and exposed passwords_ and should only be used locally for learning and
     training.  If you do want to run this cloud in production or in the cloud, at the least disable the lucee admin
     (via the frontend/secrets.txt) and change the passwords in each of the secret files.  Additionally, there is no XSS
     checking in any of the web forms or editors.

### Non-Docker Information
 - clone this repository using GIT
 - Copy the `frontend/webroot/` directory into the CFML server of your choice.  It should work fine in a sub-directory
 - Create a new database (schema) in the DB of your choice.  Well, maybe not an NoSQL server, but anything standard.
 - Log into the Administrator for your CF Engine, create a new DSN and point it to that DB.
 - Edit each of the `Application.cfc` files, and delete the `this.datasource` line and replace it with
   - `this.datasource = "datasourcename";`    with datasourcename replaced with the datasource you just created.
 - Loading the `index.cfm` file in the webroot should not give an error.  If it does, you will need to troubleshoot your engine setup to continue.

### Code used in examples
All the code used in the presentation is available in the `frontend/webroot/` directory.  There are directories setup
for each of the examples shown in the PPT.

Database will be auto-created based on code.  No SQL dumps required to follow along with.  



### License
Copyright 2023, Nick Kwiatkowski as an agent for the Michigan State University Board of Trustees

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
