STORES_NAME = ["ALDO Centre Eaton", "ALDO Destiny USA Mall", "ALDO Pheasant Lane Mall", "ALDO Holyoke Mall", "ALDO Maine Mall", "ALDO Crossgates Mall", "ALDO Burlington Mall", "ALDO Solomon Pond Mall", "ALDO Auburn Mall", "ALDO Waterloo Premium Outlets"]
SHOES_MODELS = ["ADERI", "MIRIRA", "CAELAN", "BUTAUD", "SCHOOLER", "SODANO", "MCTYRE", "CADAUDIA", "RASIEN", "WUMA", "GRELIDIEN", "CADEVEN", "SEVIDE", "ELOILLAN", "BEODA", "VENDOGNUS", "ABOEN", "ALALIWEN", "GREG", "BOZZA"]

stores = STORES_NAME.map do |store_name|
  Store.create!(name: store_name)
end

shoes = SHOES_MODELS.map do |shoe_model|
  Shoe.create!(name: shoe_model)
end

stores.each do |store|
  shoes.each do |shoe|
    Inventory.create!(
      store: store,
      shoe: shoe,
      stock: rand(0..100)
    )
  end
end

puts "Seed data successfully created!"