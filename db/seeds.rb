Car.destroy_all
Make.destroy_all
Part.destroy_all
CarPart.destroy_all

Part.create([
    {name: "Engine"},
    {name: "Battery"},
    {name: "Rear Bumper"},
    {name: "Front Bumper"},
    {name: "Distributor"},
    {name: "Headlight"},
    {name: "Airbag"},
    {name: "Spark Plug"},
    {name: "Starter"},
    {name: "Dashboard"},
    {name: "Front Seat"},
    {name: "Fan Belt"},
    {name: "Oil Filter"},
    {name: "Air Filter"},
    {name: "Fuel Tank"},
    {name: "Shock Absorber"},
    {name: "Brakes"}
])

Make.create([
    {name: "Cadillac", country: "United States"},
    {name: "Ford", country: "United States"},
    {name: "Tesla", country: "United States"},
    {name: "Chevrolet", country: "United States"},
    {name: "Nissan", country: "Japan"},
    {name: "Lexus", country: "Japan"},
    {name: "Subaru", country: "Japan"}, #This is Colorado, I had to include Subaru
    {name: "Toyota", country: "Japan"},
    {name: "Hyundai", country: "South Korea"},
    {name: "Kia", country: "South Korea"},
    {name: "Audi", country: "Germany"},
    {name: "Mercedes-Benz", country: "Germany"},
    {name: "Porsche", country: "Germany"},
    {name: "Volkswagen", country: "Germany"},
    {name: "Ferrari", country: "Italy"},
    {name: "Lamborghini", country: "Italy"},
    {name: "Maserati", country: "Italy"},
    {name: "Volvo", country: "Sweden"},
    {name: "Aston Martin", country: "United Kingdom"},
    {name: "Bentley", country: "United Kingdom"},
    {name: "Jaguar", country: "United Kingdom"},
    {name: "McLaren", country: "United Kingdom"}
])


#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
