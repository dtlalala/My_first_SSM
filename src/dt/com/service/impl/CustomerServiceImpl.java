package dt.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dt.com.dao.CustomerMapper;
import dt.com.model.Customer;
import dt.com.service.CustomerService;

@Service("customerService")
@Transactional
public class CustomerServiceImpl implements CustomerService{
	@Resource
	private CustomerMapper customerMapper;
	
	public List<Customer> findAll() {
		return customerMapper.findAl();
	}
	
	public void save(Customer customer) {
		//判断是添加还是修改
		if(customer.getId()!=null){
			//修改
			customerMapper.update(customer);
			}else{
			//增加
			customerMapper.save(customer);
			}
		
	}

	public Customer findById(Integer id) {
		// TODO Auto-generated method stub
		return customerMapper.findById(id);
	}
	
	public void delete(Integer[] id) {
		customerMapper.delete(id);
	}
}
