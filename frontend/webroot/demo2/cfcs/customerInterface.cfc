component rest="true" restpath="/customer"
{
    //https://github.com/cfjedimaster/CF10RESTPreso

    remote function listAllCustomers() httpMethod="GET"
    {
        return entityload("customer");
    }

    remote function getCustomerByID(required numeric key restArgSource="path") httpmethod="GET" restPath="/{key}"
    {
        return entityLoadByPK("customer",arguments.key);
    }



}
