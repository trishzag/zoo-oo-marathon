class ZooAtCapacity < StandardError;

end

class Zoo
  attr_reader :name, :cages, :employees
  def initialize(name, cages = 10)
    @name = name
    @cages = []
    cages.times do
      @cages << Cage.new
    end
    @employees = []
  end
  def add_employee(employee)
    @employees << employee
  end

  def add_animal(animal)
    @cages.each do |cage|
      if cage.empty?
        cage.animal = animal
      return
      end
    end
    raise ZooAtCapacity
  end

  def visit
    string = ''
    @employees.each do |employee|
      string += employee.greet + "\n"
    end
    @cages.each do |cage|
      unless cage.empty? 
      string += cage.animal.speak + "\n"
    end
    end
    return string
  end

end
