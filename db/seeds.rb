require 'securerandom'

Car.destroy_all
Make.destroy_all
Part.destroy_all
CarPart.destroy_all

Part.create([
    {id: 1,  name: "Engine"},
    {id: 2,  name: "Battery"},
    {id: 3,  name: "Rear Bumper"},
    {id: 4,  name: "Front Bumper"},
    {id: 5,  name: "Distributor"},
    {id: 6,  name: "Headlight"},
    {id: 7,  name: "Airbag"},
    {id: 8,  name: "Spark Plug"},
    {id: 9,  name: "Starter"},
    {id: 10, name: "Dashboard"},
    {id: 11, name: "Front Seat"},
    {id: 12, name: "Fan Belt"},
    {id: 13, name: "Oil Filter"},
    {id: 14, name: "Air Filter"},
    {id: 15, name: "Fuel Tank"},
    {id: 16, name: "Shock Absorber"},
    {id: 17, name: "Brakes"}
])

Make.create([
    {id: 1,  name: "Cadillac",      country: "United States"},
    {id: 2,  name: "Ford",          country: "United States"},
    {id: 3,  name: "Tesla",         country: "United States"},
    {id: 4,  name: "Chevrolet",     country: "United States"},
    {id: 5,  name: "Nissan",        country: "Japan"},
    {id: 6,  name: "Lexus",         country: "Japan"},
    {id: 7,  name: "Subaru",        country: "Japan"}, #This is Colorado, I had to include Subaru
    {id: 8,  name: "Toyota",        country: "Japan"},
    {id: 9,  name: "Hyundai",       country: "South Korea"},
    {id: 10, name: "Kia",           country: "South Korea"},
    {id: 11, name: "Audi",          country: "Germany"},
    {id: 12, name: "Mercedes-Benz", country: "Germany"},
    {id: 13, name: "Porsche",       country: "Germany"},
    {id: 14, name: "Volkswagen",    country: "Germany"},
    {id: 15, name: "Ferrari",       country: "Italy"},
    {id: 16, name: "Lamborghini",   country: "Italy"},
    {id: 17, name: "Maserati",      country: "Italy"},
    {id: 18, name: "Volvo",         country: "Sweden"},
    {id: 19, name: "Aston Martin",  country: "United Kingdom"},
    {id: 20, name: "Bentley",       country: "United Kingdom"},
    {id: 21, name: "Jaguar",        country: "United Kingdom"},
    {id: 22, name: "McLaren",       country: "United Kingdom"}
])

def gen_rand_vin
  SecureRandom.alphanumeric(10).upcase
end

Car.create([
    {id: 1,  make_id: 1, model: "Escalade", vin: gen_rand_vin},
    {id: 2,  make_id: 1, model: "CT5",      vin: gen_rand_vin},
    {id: 3,  make_id: 2, model: "Mustang",  vin: gen_rand_vin},
    {id: 4,  make_id: 2, model: "Mustang",  vin: gen_rand_vin},
    {id: 5,  make_id: 2, model: "Explorer", vin: gen_rand_vin},
    {id: 6,  make_id: 2, model: "Explorer", vin: gen_rand_vin},
    {id: 7,  make_id: 2, model: "Explorer", vin: gen_rand_vin},
    {id: 8,  make_id: 2, model: "Escape",   vin: gen_rand_vin},
    {id: 9,  make_id: 3, model: "Model 3",  vin: gen_rand_vin},
    {id: 10, make_id: 3, model: "Model S",  vin: gen_rand_vin},
    {id: 11, make_id: 3, model: "Model S",  vin: gen_rand_vin},
    {id: 12, make_id: 3, model: "Model X",  vin: gen_rand_vin},
    {id: 13, make_id: 4, model: "Camaro",   vin: gen_rand_vin},
    {id: 14, make_id: 4, model: "Corvette", vin: gen_rand_vin},
    {id: 15, make_id: 4, model: "Equinox",  vin: gen_rand_vin},
    {id: 16, make_id: 4, model: "Traverse", vin: gen_rand_vin},
    {id: 17, make_id: 5, model: "Murano",   vin: gen_rand_vin},
    {id: 18, make_id: 5, model: "Murano",   vin: gen_rand_vin},
    {id: 19, make_id: 5, model: "Sentra",   vin: gen_rand_vin},
    {id: 20, make_id: 5, model: "Sentra",   vin: gen_rand_vin},
    {id: 21, make_id: 5, model: "Altima",   vin: gen_rand_vin},
    {id: 22, make_id: 6, model: "CT",       vin: gen_rand_vin},
    {id: 23, make_id: 7, model: "Outback",  vin: gen_rand_vin},
    {id: 24, make_id: 7, model: "Outback",  vin: gen_rand_vin},
    {id: 25, make_id: 7, model: "Outback",  vin: gen_rand_vin},
    {id: 26, make_id: 7, model: "Forester", vin: gen_rand_vin},
    {id: 27, make_id: 8, model: "Camry",    vin: gen_rand_vin}
])
