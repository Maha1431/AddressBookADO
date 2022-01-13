using System;

namespace ADo.NET_AddressBook
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            AddressBook_Model addressModel = new AddressBook_Model();
            AddressBook_Repos repos = new AddressBook_Repos();
           // repos.GetAllData();
            addressModel.FirstName = "teju";
            addressModel.LastName = "hasini";
            addressModel.Address = "tr.r nagar";
            addressModel.City = "nellore";
            addressModel.State = "andra";
            addressModel.Zipcode = 8271;
            addressModel.PhoneNumber = "981276267";
            addressModel.Email = "teju@gmail.com";
            addressModel.type = "family";
            addressModel.AddressBookName = "business";

            //repos.InsertData(addressModel);
            addressModel.FirstName = "teju";
            addressModel.State = "UP";
           // repos.UpdateData(addressModel);
            addressModel.City = "pune";
            addressModel.State = "BomBay";
            repos.RetriveAddressBookCityOrState(addressModel);
        }
    }
}
