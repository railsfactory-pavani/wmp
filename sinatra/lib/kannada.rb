class Kannadacalendar


 def self.convert(day)
   
   if day == "Monday"
     return "somavara"
   elsif day == "Tuesday"
     return "mangalavara"
   elsif day == "Wednesday"
     return "budhavara"
   elsif day == "Thursday"
     return "guruvara"
   elsif day == "Friday"
     return "shukravara"
   elsif day == "Saturday"
     return "shanivara"
   else day == "Sunday"
     return "bhanuvara"
  end
 end
end
