import java.time.LocalDate;

public class Main {
    public static void main(String[] args) {
      // LocalDate localDate = LocalDate.now();
      LocalDate localDate = LocalDate.of(2024, 2, 29);
      int firstMonthWeekday = localDate.minusDays(localDate.getDayOfWeek().getValue()).getDayOfMonth() + 1;

      // System.out.println(localDate);
      // System.out.println(firstMonthDay);

      System.out.println(getCurrentWeekDate());
      int[] bleh = getCurrentWeekWeekdays();
      for (int i = 0; i < 7; i++) {
        System.out.println(Integer.toString(bleh[i]));
      }
    }
    
    public static LocalDate getCurrentWeekDate() {
        LocalDate currentDate = LocalDate.of(2024, 2, 29);

        int currentYear = currentDate.getYear();
        int currentMonth = currentDate.getMonthValue();
        int weekFirstMonthday = getLD_firstMonthWeekday(currentDate);

        // return: year, month, first day of week
        return LocalDate.of(currentYear, currentMonth, weekFirstMonthday);
    }

    public static int getLD_firstMonthWeekday(LocalDate localDate) {
        // As opposed to JavaScript, Java uses an Enum class DayOfWeek, wherein the weekday
        // numberings are contained in the interval [1,7].
        //
        //  int             LocalDate long                DayOfWeek      int         int
        int firstMonthWeekday = localDate.minusDays(localDate.getDayOfWeek().getValue()).getDayOfMonth() + 1;

        return firstMonthWeekday;
    }

    public static int[] getCurrentWeekWeekdays() {
      int[] weekdays = new int[7];

      LocalDate weekDate = getCurrentWeekDate();
      for (int i = 0; i < 7; i++) {
          weekdays[i] = weekDate.getDayOfMonth();
          weekDate = weekDate.plusDays(1);
      }

      return weekdays;
  }
}
