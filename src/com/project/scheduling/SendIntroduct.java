package com.project.scheduling;
import java.util.TimerTask;
import java.util.Timer;

public class SendIntroduct {
	Timer timer;
	 public SendIntroduct(int seconds) {
	        timer = new Timer();
	        timer.schedule(new RemindTask(), seconds*1000);
		}

	    class RemindTask extends TimerTask {
	        public void run() {
	            System.out.println("Time's up!");
	            timer.cancel(); //Terminate the timer thread
	        }
	    }

	    public static void main(String args[]) {
	        new SendIntroduct(5);
	        System.out.println("Task scheduled.");
	    }
	
	
}