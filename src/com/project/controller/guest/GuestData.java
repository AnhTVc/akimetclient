package com.project.controller.guest;

import java.util.ArrayList;

import com.project.POJO.Reservation;

public class GuestData {
	private ArrayList<Reservation> reservations;

	public ArrayList<Reservation> getReservations() {
		return reservations;
	}

	public void setReservations(ArrayList<Reservation> reservations) {
		this.reservations = reservations;
	}
}
