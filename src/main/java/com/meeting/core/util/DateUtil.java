package com.meeting.core.util;

/**
 * 2016/9/13 00:23:39
 * @author 白云飞
 *
 */
public class DateUtil {

	private static int years;
	private static int months;
	private static int days;

	private static void setTimes(String times) {
		String year = times.substring(0, 4);
		try {
			String month = times.substring(5, 7);
			months = Integer.parseInt(month);
		} catch (Exception e) {
			System.out.println("no month");
		}
		try {
			String day = times.substring(8, 10);
			days = Integer.parseInt(day);
		} catch (Exception e) {
			System.out.println("no day");
			days = 0;
		}
		years = Integer.parseInt(year);
	}

	private static String changeN(int n) {
		String result = "" + n;
		if (n < 10) {
			result = "0" + n;
		}
		return result;
	}

	private static int showDaysOfMonth(int year, int month) {
		int days[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
		if (2 == month && 0 == (year % 4) && (0 != (year % 100) || 0 == (year % 400))) {
			days[1] = 29;
		}
		return (days[month - 1]);
	}

	public static String beginOfDay18(String times) {
		setTimes(times);
		String hourStr = "18:00:00";
		if (times.length() == 19)
			hourStr = times.split(" ")[1];
		else if (times.length() == 16)
			hourStr = times.split(" ")[1] + ":00";
		else if (times.length() == 13)
			hourStr = times.split(" ")[1] + ":00:00";

		String result = null;
		if (days - 1 > 0) {
			days = days - 1;
			String month = changeN(months);
			String day = changeN(days);
			result = years + "-" + month + "-" + day + " " + hourStr;
		} else {
			result = beginOfMon18(times);
		}
		return result;
	}

	public static String beginOfMon18(String times) {
		String result = null;
		setTimes(times);
		if (months - 1 > 0) {
			months = months - 1;
			String month = changeN(months);
			result = years + "-" + month + "-" + showDaysOfMonth(years, months) + " 18:00:00";
		} else {
			result = beginOfYear18(times);
		}
		return result;
	}

	public static String beginOfYear18(String times) {
		String result = null;
		setTimes(times);
		years = years - 1;
		result = years + "-" + 12 + "-" + showDaysOfMonth(years, 12) + " 18:00:00";
		return result;
	}
}
