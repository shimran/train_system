class Stop

  attr_reader(:train_id, :station_id)

  define_method(:initialize) do |attributes|
    @train_id = attributes.fetch(:train_id).to_i()
    @station_id = attributes.fetch(:station_id).to_i()
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stops (train_id, station_id) VALUES (#{@train_id}, #{@station_id}) RETURNING id")
    @id = result.first().fetch("id").to_i()

  end

  define_singleton_method(:all) do
    returned_stops = DB.exec("SELECT * FROM stops")
    stops = []
    returned_stops.each()  do |stop|
      train_id= stop.fetch("train_id")
      station_id= stop.fetch("station_id")
      stops.push(Stop.new({:train_id => train_id, :station_id => station_id}))
      end
    stops
  end

  define_method(:==) do |another_stop|
    self.train_id().==(another_stop.train_id()).&(self.station_id().==(another_stop.station_id()))
  end
end

  # define_method(:get_stations) do
  #   returned_trains = DB.exec("SELECT train_id FROM stops")
  #   stations = []
  #   returned_trains.each() do |train|
  #
  # end
