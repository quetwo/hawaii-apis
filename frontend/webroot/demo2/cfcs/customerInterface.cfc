component rest="true" restpath="/customer"
{

    // Just get a list of all customers. Just a normal GET statement.  Returns an array.
    remote function listAllCustomers() httpMethod="GET"
    {
        return entityload("customer");
    }

    // Get a particular customer.  Returns a JSON object of the customer.
    remote function getCustomerByID(required numeric key restArgSource="path") httpmethod="GET" restPath="/{key}"
    {
        return entityLoadByPK("customer",arguments.key);
    }


    // Inserts the customer into the DB.  Uses the PUT verb to identify this.
    remote function insertCustomer(
            required string username restArgSource="form",
            required string email restArgSource="form",
            required string sales restArgSource="form") httpMethod="PUT"
    {
        newCustomer = entityNew("customer");
        newCustomer.setcustomerName(form.username);
        newCustomer.setcustomerEmail(form.email);
        newCustomer.setSales(form.sales);

        entitySave(newCustomer);
        ormflush();

        return newCustomer;
    }

    // Deletes the customer from the DB.  Uses the DELETE verb, but pulls the customer ID via the REST path.
    remote function deleteCustomer(required numeric key restArgSource="path") httpmethod="DELETE" restPath="/{key}"
    {
        delCustomer = entityLoadByPK("customer",key);
        entityDelete(delCustomer);
        ormFlush();

        return "OK";
    }

    // Updates a customer from the DB.  Uses the PATCH verb, but pulls the customer ID via the REST path.
    remote function updateCustomer(
            required numeric key restArgSource="path",
            required numeric sales restArgSource="form") httpMethod="PATCH" restPath="/{key}"
    {
        myCustomer = entityLoadByPK("customer",arguments.key);
        myCustomer.setSales(arguments.sales);
        entitySave(myCustomer);
        ormFlush();

        return myCustomer;
    }

    // example of pulling properties from the header.  Could include a token of somekind
    remote function updateCustomerEmail
            (required numeric key restArgSource="path",
             required string email restArgSource="form",
             required string token restArgSource="header") httpMethod="POST" restPath="/{key}/email"
    {
        if (arguments.token EQ 'abc-123')
        {
            myCustomer = entityLoadByPK("customer",arguments.key);
            myCustomer.setCustomerEmail(arguments.email);
            entitySave(myCustomer);
            ormFlush();
            return "OK!";
        }
        else
        {
            restResponse = {};
            restResponse.status=401;
            restResponse.content="Token invalid.";
            RestSetResponse(restResponse);
        }
    }

}
