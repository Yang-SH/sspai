package entity;

/**
 * 用户保证结果的类
 * 
 * @author DouDou
 *
 */
public class Result {

	private String type;
	private Object data;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public Result(String type, Object data) {
		super();
		this.type = type;
		this.data = data;
	}

	public Result() {
		super();
	}

	@Override
	public String toString() {
		return "Result [type=" + type + ", data=" + data + "]";
	}

}
