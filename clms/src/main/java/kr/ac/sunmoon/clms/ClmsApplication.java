package kr.ac.sunmoon.clms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class ClmsApplication {
	public static void main(String[] args) {
		SpringApplication.run(ClmsApplication.class, args);
	}
}
