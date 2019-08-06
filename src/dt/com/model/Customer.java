package dt.com.model;

public class Customer {
	private Integer id;
	private String name;
	private String work;
	private String tel;
	private String email;
	private String birth;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}

	@Override
	public String toString(){
		return "Customer [id="+id+", name="+name+", work="+work+", tel="+tel+", email="+email+", birth="+birth+"]";
		
		
	}
	
	
}
