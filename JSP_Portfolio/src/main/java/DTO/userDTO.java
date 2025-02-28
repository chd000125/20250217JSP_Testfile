package DTO;

public class userDTO {
	private String userId;
	private String nickname;
	private String userPw;
	private String userEm;
	private String loc;
	
	public userDTO(String userId, String nickname, String userPw, String userEm, String loc) {
		super();
		this.userId = userId;
		this.nickname = nickname;
		this.userPw = userPw;
		this.userEm = userEm;
		this.loc = loc;
	}

	public String getUserId() { return userId; }
	public void setUserId(String userId) { this.userId = userId; }

	public String getNickname() { return nickname; } 
	public void setNickname(String nickname) { this.nickname = nickname; }

	public String getUserPw() { return userPw; }
	public void setUserPw(String userPw) { this.userPw = userPw; }

	public String getUserEm() { return userEm; }
	public void setUserEm(String userEm) { this.userEm = userEm; }

	public String getLoc() { return loc; }
	public void setLoc(String loc) { this.loc = loc; }  
}
