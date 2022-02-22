package metier;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the score database table.
 * 
 */
@Entity
@NamedQuery(name="Score.findAll", query="SELECT s FROM Score s")
public class Score implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private Integer sno;

	@Temporal(TemporalType.DATE)
	private Date dat;

	private String login;

	private Integer score;

	public Score() {
	}

	public Integer getSno() {
		return this.sno;
	}

	public void setSno(Integer sno) {
		this.sno = sno;
	}

	public Date getDat() {
		return this.dat;
	}

	public void setDat(Date dat) {
		this.dat = dat;
	}

	public String getLogin() {
		return this.login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

}