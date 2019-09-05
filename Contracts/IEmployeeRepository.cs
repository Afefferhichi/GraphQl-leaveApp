using API_Test.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API_Test.Contracts
{
    public interface IEmployeeRepository
    {
        IEnumerable<Employee> GetAll();
        Employee GetEmployeeById(int id);

        Employee GetEmployeeByLogin (string login, string password);
        Employee CreateEmployee(Employee employee);

        Employee UpdateEmployee(Employee dbemployee, Employee employee);

        Employee UpdateEmployeeRemaining(Employee dbemployee, int RemainingCongeSolde);
    }
}
