component
{

    this.name = "ElectionApp";
    this.datasource = {
        class: 'com.mysql.cj.jdbc.Driver'
        , bundleName: 'com.mysql.cj'
        , bundleVersion: '8.0.19'
        , connectionString: 'jdbc:mysql://db:3306/' & server.system.environment.MYSQL_DATABASE & '?characterEncoding=UTF-8&serverTimezone=Etc/UTC&autoReconnect=true&maxReconnects=3&allowMultiQueries=true'
        , username: server.system.environment.MYSQL_USER
        , password: server.system.environment.MYSQL_PASSWORD
        , connectionLimit:100 // default:-1
        , alwaysSetTimeout:true // default: false
        , validate:false // default: false
    };


    this.sessionmanagement = true;
    this.sessiontimeout = createTimespan(0,0,30,0);   // 0 days, 0 hours, 30 minutes, 0 seconds
    this.applicationtimeout = createTimespan(1, 0, 0, 0);  // 1 days, 0 hours, 0 minutes, 0 seconds

    function onApplicationStart()
    {

        // ReInitApplication
        // 1st param = path that contains your REST endpoints
        // 2nd param = URL to your endpoints.  Normally, this is after /rest/  e.g. /rest/electiondata/
        // 3rd param = If this is the default REST endpoint.  Usually set to false
        // 4th param = the Lucee admin password to auto-provision the REST endpoint
        RestInitApplication(expandPath('./cfcs'), '/electiondata', false, server.system.environment.ADMIN_PASSWORD);

    }

}
