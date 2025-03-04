package DTO;

public class userDTO {
	private String userId;
	private String nickname;
	private String userPw;
	private String userEm;
	
	public userDTO(String userId, String nickname, String userPw, String userEm) {
		super();
		this.userId = userId;
		this.nickname = nickname;
		this.userPw = userPw;
		this.userEm = userEm;
	}

	public String getUserId() { return userId; }
	public void setUserId(String userId) { this.userId = userId; }

	public String getNickname() { return nickname; } 
	public void setNickname(String nickname) { this.nickname = nickname; }

	public String getUserPw() { return userPw; }
	public void setUserPw(String userPw) { this.userPw = userPw; }

	public String getUserEm() { return userEm; }
	public void setUserEm(String userEm) { this.userEm = userEm; }
}
