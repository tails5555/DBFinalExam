package net.exam.mentoring.model;

import lombok.Data;

@Data
public class Option {
	int value;
	String label;
	public Option(int value, String label) {
		this.value=value;
		this.label=label;
	}
}
