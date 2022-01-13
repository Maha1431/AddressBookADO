using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace ADo.NET_AddressBook
{
   class AddressBook_Repos
    {
        public static string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=AddressBookservice;Integrated Security=True;";
        public void GetAllData()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                AddressBook_Model addressModel = new AddressBook_Model();
                using (connection)
                {
                    SqlCommand command = new SqlCommand("spGetAllAddressBook", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    SqlDataReader dr = command.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                           
                            addressModel.FirstName = dr.GetString(0);
                            addressModel.LastName = dr.GetString(1);
                            addressModel.Address = dr.GetString(2);
                            addressModel.City = dr.GetString(3);
                            addressModel.State = dr.GetString(4);
                            addressModel.Zipcode = dr.GetInt32(5);
                            addressModel.PhoneNumber = dr.GetString(6);
                            addressModel.Email = dr.GetString(7);
                            Console.WriteLine("{0},{1},{2},{3},{4},{5},{6},{7}", addressModel.FirstName, addressModel.LastName
                                , addressModel.Address, addressModel.City, addressModel.State, addressModel.Zipcode, addressModel.PhoneNumber, addressModel.Email);

                        }
                        dr.Close();
                        connection.Close();
                    }
                    else
                    {
                        Console.WriteLine("No data found");
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                connection.Close();
            }
        }
        public bool InsertData(AddressBook_Model addressModel)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                using (connection)
                {
                    SqlCommand command = new SqlCommand("spAddInAddressBook", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@FirstName", addressModel.FirstName);
                    command.Parameters.AddWithValue("@LastName", addressModel.LastName);
                    command.Parameters.AddWithValue("@Address", addressModel.Address);
                    command.Parameters.AddWithValue("@City", addressModel.City);
                    command.Parameters.AddWithValue("@State", addressModel.State);
                    command.Parameters.AddWithValue("@Zipcode", addressModel.Zipcode);
                    command.Parameters.AddWithValue("@PhoneNumber", addressModel.PhoneNumber);
                    command.Parameters.AddWithValue("@Email", addressModel.Email);
                    connection.Open();
                    var result = command.ExecuteNonQuery();
                    if (result != 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                connection.Close();
            }
        }

        public bool UpdateData(AddressBook_Model addressModel)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                using (connection)
                {
                    SqlCommand command = new SqlCommand("spUpdateInAddressBook", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@FirstName", addressModel.FirstName);
                    command.Parameters.AddWithValue("@State", addressModel.State);
                   connection.Open();
                    var result = command.ExecuteNonQuery();
                    if (result != 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                connection.Close();
            }
        }
        public bool DeletePerson(AddressBook_Model addressModel)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                using (connection)
                {
                    SqlCommand command = new SqlCommand("spDeleteInAddressBook", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@FirstName", addressModel.FirstName);
                    connection.Open();
                    var result = command.ExecuteNonQuery();
                    if (result != 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                connection.Close();
            }
        }
        public void RetriveAddressBookCityOrState(AddressBook_Model addressModel)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                using (connection)
                {
                    SqlCommand command = new SqlCommand("spAddressBookCityorState", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@City", addressModel.City);
                    command.Parameters.AddWithValue("@State", addressModel.State);
                    connection.Open();
                    SqlDataReader dr = command.ExecuteReader();
                    //command.ExecuteNonQuery();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            addressModel.FirstName = dr.GetString(0);
                            addressModel.City = dr.GetString(1);
                            addressModel.State = dr.GetString(2);
                            Console.WriteLine(addressModel.FirstName + "," + addressModel.City + "," + addressModel.State);
                        }
                    }
                    else
                    {
                        Console.WriteLine("Data not found");
                    }
                    dr.Close();
                    connection.Close();
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                connection.Close();
            }
        }
    }
}
