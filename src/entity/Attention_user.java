package entity;

public class Attention_user {
	private int user_id;//用户id
	private int other_user_id;//被关注用户id
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getOther_user_id() {
		return other_user_id;
	}
	public void setOther_user_id(int other_user_id) {
		this.other_user_id = other_user_id;
	}
	@Override
	public String toString() {
		return "Attention_user [user_id=" + user_id + ", other_user_id=" + other_user_id + "]";
	}
	public Attention_user(int user_id, int other_user_id) {
		super();
		this.user_id = user_id;
		this.other_user_id = other_user_id;
	}
	public Attention_user() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
