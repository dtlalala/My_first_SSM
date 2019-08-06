package dt.com.service;

import java.util.List;
import dt.com.model.Customer;

public interface CustomerService {
	public List<Customer> findAll();

	public void save(Customer customer);

	public Customer  findById(Integer id);

	public void delete(Integer[] id);
}
