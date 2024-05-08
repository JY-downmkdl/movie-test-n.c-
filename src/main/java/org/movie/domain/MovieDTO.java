package org.movie.domain;

import java.util.Date;

import lombok.Data;

public class MovieDTO {
	private int movcode;
	private String movname;
	private String movdirector;
	private String movgenre;
	private String movgrade;
	private String movrunningtime;
	private String movrelease;
//	private String movposter;
	
	private String fileName;
	private String uploadPath;
	private String fullname;
	
	private int thstates;

	public int getMovcode() {
		return movcode;
	}

	public void setMovcode(int movcode) {
		this.movcode = movcode;
	}

	public String getMovname() {
		return movname;
	}

	public void setMovname(String movname) {
		this.movname = movname;
	}

	public String getMovdirector() {
		return movdirector;
	}

	public void setMovdirector(String movdirector) {
		this.movdirector = movdirector;
	}

	public String getMovgenre() {
		return movgenre;
	}

	public void setMovgenre(String movgenre) {
		this.movgenre = movgenre;
	}

	public String getMovgrade() {
		return movgrade;
	}

	public void setMovgrade(String movgrade) {
		this.movgrade = movgrade;
	}

	public String getMovrunningtime() {
		return movrunningtime;
	}

	public void setMovrunningtime(String movrunningtime) {
		this.movrunningtime = movrunningtime;
	}

	public String getMovrelease() {
		return movrelease;
	}

	public void setMovrelease(String movrelease) {
		this.movrelease = movrelease;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public int getThstates() {
		return thstates;
	}

	public void setThstates(int thstates) {
		this.thstates = thstates;
	}
	
	
	
}
