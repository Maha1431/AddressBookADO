using ADo.NET_AddressBook;
using Microsoft.VisualStudio.TestTools.UnitTesting;


namespace TEST2
{
    [TestClass]
    public class UnitTest1
    {
        AddressBook_Model addressModel = new AddressBook_Model();
       
        [TestMethod]
        public void InsertIntoAddressBookTable()
        {
            addressModel.FirstName = "teju";
            addressModel.State = "UP";
            AddressBook_Repos repos = new AddressBook_Repos();
            bool result = repos.InsertData(addressModel);
            Assert.IsTrue(result);
        }


        [TestMethod]
        public void UpdateValueIntoAddresBookTable()
        {
            AddressBook_Model addressModel = new AddressBook_Model();
            addressModel.FirstName = "Maha";
            addressModel.State = "Karnataka";
            AddressBook_Repos repos = new AddressBook_Repos();
            bool result = repos.UpdateData(addressModel);
            Assert.IsTrue(result);
        }

        [TestMethod]
        public void DeleteAddressBook()
        {
            AddressBook_Model addressModel = new AddressBook_Model();
            addressModel.FirstName = "promod";
            AddressBook_Repos repos = new AddressBook_Repos();
            bool result = repos.DeletePerson(addressModel);
            Assert.IsTrue(result);
        }


    }

}

