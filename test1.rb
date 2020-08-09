class LearningRuby
  def whileloop
    i = 0
    while i<3 do
      puts "i #{i}"
      i+=1
    end
  end
end
lr = LearningRuby.new
lr.whileloop()