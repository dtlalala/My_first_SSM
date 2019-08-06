package dt.com.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dt.com.model.Customer;
import dt.com.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	@Resource
	private CustomerService customerService;
	@RequestMapping("/list")
	@ResponseBody
	public List<Customer> list() {
		List<Customer> list = customerService.findAll();
		return list;
	}

	private Map<String, Object> result = new HashMap<String, Object>();

	@RequestMapping("/save")
	@ResponseBody
	public Map<String, Object> save(Customer customer){
		try {
			customerService.save(customer);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success",false);
			result.put("msg", e.getMessage());
		}
		return result;
	}

	@RequestMapping("/findById")
	@ResponseBody
	public Customer findById(@RequestParam Integer id){
		Customer cus = customerService.findById(id);
		return cus;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Map<String,Object> delete(Integer[] id){
		try {
			customerService.delete(id);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
}
