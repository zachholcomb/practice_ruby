require 'humanize'

class TwelveDays
  class << self
    def song
      return @@song_text.join if @@round == 13
      new_line = generate_first_part
      new_line += generate_last_part(@@round, "")
      new_line = remove_end_character(new_line)
      @@song_text <<  new_line
      @@round += 1
      song
    end

    private

    @@key ={
        1 => ["first", "a Partridge in a Pear Tree.\n\n"],
        2 => ["second", "Turtle Doves"],
        3 => ["third", "French Hens"],
        4 => ["fourth", "Calling Birds"],
        5 => ["fifth", "Gold Rings"],
        6 => ["sixth", "Geese-a-Laying"],
        7 => ["seventh", "Swans-a-Swimming"],
        8 => ["eighth", "Maids-a-Milking"],
        9 => ["ninth", "Ladies Dancing"],
        10 => ["tenth", "Lords-a-Leaping"],
        11 => ["eleventh", "Pipers Piping"],
        12 => ["twelfth", "Drummers Drumming"]
      }
    @@round = 1
    @@song_text = []

    def generate_first_part
      "On the #{@@key[@@round][0]} day of Christmas my true love gave to me:"
    end

    def generate_last_part(count, last)
      return last if count == 0

      if count > 1
        last = generate_christmas_cheer(count, last)
      elsif count == 1
        last = and?(count, last)
      end
      count -= 1
      generate_last_part(count, last)
    end

    def generate_christmas_cheer(count, last)
      last += (" " + count.humanize)
      last += (" " + @@key[count][1] + ",")
    end

    def and?(count, last)
      if @@round == 1
          last += (" " + @@key[count][1])
      else
          last += (" and " + @@key[count][1])
      end
    end

    def remove_end_character(line)
      return line.chomp! if @@round == 12
      line
    end
  end
end