component
{
    this.name = "CRMApp";
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

    this.ormenabled = true;
    this.ormsettings =
    {
        logsql: true,
        dbcreate: "update"
    };

    this.sessionmanagement = true;
    this.sessiontimeout = createTimespan(0,0,30,0);   // 0 days, 0 hours, 30 minutes, 0 seconds
    this.applicationtimeout = createTimespan(1, 0, 0, 0);  // 1 days, 0 hours, 0 minutes, 0 seconds

    function onApplicationStart()
    {

        RestInitApplication(expandPath('./cfcs'), '/crm', false, server.system.environment.ADMIN_PASSWORD);

    }

}
