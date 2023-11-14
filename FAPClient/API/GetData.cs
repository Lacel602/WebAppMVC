using FAPClient.Models;
using Newtonsoft.Json;
using System;

namespace FAPClient.API
{
    public class GetData
    {
        internal async Task<List<CampusDTO>> GetAllCampus()
        {
            try
            {
                string link = "https://localhost:5000/api/Campus/GetAllCampus";

                using (HttpClient client = new HttpClient())
                {
                    using (HttpResponseMessage responseMessage = await client.GetAsync(link))
                    {
                        if (responseMessage.IsSuccessStatusCode)
                        {
                            using (HttpContent content = responseMessage.Content)
                            {
                                string data = await content.ReadAsStringAsync();

                                List<CampusDTO> list = JsonConvert.DeserializeObject<List<CampusDTO>>(data);

                                return list;
                            }
                        }
                        else
                        {
                            Console.WriteLine("HTTP request failed with status code: " + responseMessage.StatusCode);
                            return null;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.Message);
                return null;
            }
        }

        internal async Task<List<RoomDTO>> GetAllRoom()
        {
            try
            {
                string link = "https://localhost:5000/api/Room/GetAllRoom";

                using (HttpClient client = new HttpClient())
                {
                    using (HttpResponseMessage responseMessage = await client.GetAsync(link))
                    {
                        if (responseMessage.IsSuccessStatusCode)
                        {
                            using (HttpContent content = responseMessage.Content)
                            {
                                string data = await content.ReadAsStringAsync();

                                List<RoomDTO> list = JsonConvert.DeserializeObject<List<RoomDTO>>(data);

                                return list;
                            }
                        }
                        else
                        {
                            Console.WriteLine("HTTP request failed with status code: " + responseMessage.StatusCode);
                            return null;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.Message);
                return null;
            }
        }

        internal async Task<List<SlotDTO>> GetAllSlotCurr()
        {
            try
            {
                string link = "https://localhost:5000/api/Slot/GetAllSlotByCur";

                using (HttpClient client = new HttpClient())
                {
                    using (HttpResponseMessage responseMessage = await client.GetAsync(link))
                    {
                        if (responseMessage.IsSuccessStatusCode)
                        {
                            using (HttpContent content = responseMessage.Content)
                            {
                                string data = await content.ReadAsStringAsync();

                                List<SlotDTO> list = JsonConvert.DeserializeObject<List<SlotDTO>>(data);

                                return list;
                            }
                        }
                        else
                        {
                            Console.WriteLine("HTTP request failed with status code: " + responseMessage.StatusCode);
                            return null;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.Message);
                return null;
            }
        }

        internal async Task<List<SlotTimeDTO>> GetAllSlotTime()
        {
            try
            {
                string link = "https://localhost:5000/api/SlotTime/GetAllSlotTime";

                using (HttpClient client = new HttpClient())
                {
                    using (HttpResponseMessage responseMessage = await client.GetAsync(link))
                    {
                        if (responseMessage.IsSuccessStatusCode)
                        {
                            using (HttpContent content = responseMessage.Content)
                            {
                                string data = await content.ReadAsStringAsync();

                                List<SlotTimeDTO> list = JsonConvert.DeserializeObject<List<SlotTimeDTO>>(data);

                                return list;
                            }
                        }
                        else
                        {
                            Console.WriteLine("HTTP request failed with status code: " + responseMessage.StatusCode);
                            return null;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.Message);
                return null;
            }
        }

        internal async Task<List<UserDTO>> GetAllStudentInClass(int? classId)
        {
            try
            {
                string link = "https://localhost:5000/api/Class/GetAllStudentInClass";

                using (HttpClient client = new HttpClient())
                {
                    using (HttpResponseMessage responseMessage = await client.GetAsync(link + "/" + classId))
                    {
                        if (responseMessage.IsSuccessStatusCode)
                        {
                            using (HttpContent content = responseMessage.Content)
                            {
                                string data = await content.ReadAsStringAsync();

                                List<UserDTO> list = JsonConvert.DeserializeObject<List<UserDTO>>(data);

                                return list;
                            }
                        }
                        else
                        {
                            Console.WriteLine("HTTP request failed with status code: " + responseMessage.StatusCode);
                            return null;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.Message);
                return null;
            }
        }

        internal async Task<SlotDTO> GetSlotById(int id)
        {
            try
            {
                string link = "https://localhost:5000/api/Slot/GetSlotById";

                using (HttpClient client = new HttpClient())
                {
                    using (HttpResponseMessage responseMessage = await client.GetAsync(link + "/" + id))
                    {
                        if (responseMessage.IsSuccessStatusCode)
                        {
                            using (HttpContent content = responseMessage.Content)
                            {
                                string data = await content.ReadAsStringAsync();

                                SlotDTO slot = JsonConvert.DeserializeObject<SlotDTO>(data);

                                return slot;
                            }
                        }
                        else
                        {
                            Console.WriteLine("HTTP request failed with status code: " + responseMessage.StatusCode);
                            return null;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.Message);
                return null;
            }
        }

        internal async Task<List<SlotDTO>> GetStudentSlot(int uid, DateTime startDate, DateTime endDate)
        {
            try
            {
                string link = "https://localhost:5000/api/Slot";

                string formattedstartDate = startDate.ToString("yyyy-MM-dd");
                string formattedendDate = endDate.ToString("yyyy-MM-dd");

                using (HttpClient client = new HttpClient())
                {
                    using (HttpResponseMessage responseMessage = await client.GetAsync(link + "/GetStudentSlot/" + uid + "/" + formattedstartDate + "/" + formattedendDate))
                    {
                        if (responseMessage.IsSuccessStatusCode)
                        {
                            using (HttpContent content = responseMessage.Content)
                            {
                                string data = await content.ReadAsStringAsync();

                                List<SlotDTO> list = JsonConvert.DeserializeObject<List<SlotDTO>>(data);

                                return list;
                            }
                        }
                        else
                        {
                            Console.WriteLine("HTTP request failed with status code: " + responseMessage.StatusCode);
                            return null;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.Message);
                return null;
            }
        }

        internal async Task<List<SlotDTO>> GetTeacherSlot(int uid, DateTime startDate, DateTime endDate)
        {
            try
            {
                string link = "https://localhost:5000/api/Slot";

                string formattedstartDate = startDate.ToString("yyyy-MM-dd");
                string formattedendDate = endDate.ToString("yyyy-MM-dd");

                using (HttpClient client = new HttpClient())
                {
                    using (HttpResponseMessage responseMessage = await client.GetAsync(link + "/GetTeacherSlot/" + uid + "/" + formattedstartDate + "/" + formattedendDate))
                    {
                        if (responseMessage.IsSuccessStatusCode)
                        {
                            using (HttpContent content = responseMessage.Content)
                            {
                                string data = await content.ReadAsStringAsync();

                                List<SlotDTO> list = JsonConvert.DeserializeObject<List<SlotDTO>>(data);

                                return list;
                            }
                        }
                        else
                        {
                            Console.WriteLine("HTTP request failed with status code: " + responseMessage.StatusCode);
                            return null;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.Message);
                return null;
            }
        }

        internal async Task<UserDTO> GetUserByEmailAsync(string email)
        {
            try
            {
                string link = "https://localhost:5000/api/Users";

                using (HttpClient client = new HttpClient())
                {
                    using (HttpResponseMessage responseMessage = await client.GetAsync(link + "/GetUserByEmail/" + email))
                    {
                        if (responseMessage.IsSuccessStatusCode)
                        {
                            using (HttpContent content = responseMessage.Content)
                            {
                                string data = await content.ReadAsStringAsync();

                                UserDTO list = JsonConvert.DeserializeObject<UserDTO>(data);

                                return list;
                            }
                        }
                        else
                        {
                            Console.WriteLine("HTTP request failed with status code: " + responseMessage.StatusCode);
                            return null;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.Message);
                return null;
            }
        }

        internal async Task PutSlotAsync(SlotDTO slot)
        {
            try
            {
                string link = "https://localhost:5000/api/Slot/UpdateSlot";

                using (HttpClient client = new HttpClient())
                {
                    using (HttpResponseMessage responseMessage = await client.PutAsJsonAsync(link, slot))
                    {
                        if (responseMessage.IsSuccessStatusCode)
                        {
                            Console.WriteLine("Update succesfully");
                        }
                        else
                        {
                            Console.WriteLine("Update slot failed!");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.Message);
            }
        }
    }
}