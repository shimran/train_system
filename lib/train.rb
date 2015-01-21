class Train
  attr_reader(:name, :direction, :express, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @direction = attributes.fetch(:direction)
    @express = attributes.fetch(:express)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_trains = DB.exec("SELECT * FROM train")
    trains = []
    returned_trains.each() do |train|
      name = train.fetch("name")
      direction = train.fetch("direction")
      express = train.fetch("express")
      id = train.fetch("id").to_i()
      trains.push(Train.new({:name => name, :direction => direction, :express => express, :id => id}))
    end
    trains
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO train (name, direction, express) VALUES ('#{@name}', '#{@direction}', '#{@express}') RETURNING id")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_train|
    self.name().==(another_train.name()).&(self.direction().==(another_train.direction())).&(self.express().==(another_train.express())).&(self.id().==(another_train.id()))

  end


end
