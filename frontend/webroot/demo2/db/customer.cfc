component persistent="true" entityname="customer" table="customer"
{
    property name="customerID" fieldtype="id" column="customerID" generator="increment";
    property name="customerName" fieldtype="column" ormType="string";
    property name="customerEmail" fieldtype="column" ormType="string";
    property name="sales" fieldtype="column" ormType="numeric";
}