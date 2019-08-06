package dt.com.dao;

import java.util.List;
import dt.com.model.Customer;

public interface CustomerMapper {
	public List<Customer> findAl();

	public void save(Customer customer);

	public void update(Customer customer);

	public Customer findById(Integer id);

	public void delete(Integer[] id);
	
}
