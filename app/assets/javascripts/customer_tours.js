

function CustomerTours(data){
  this.id = data.id
  this.tour = new Tour(data.tour)
  this.customerId = new CustomerTours(data.customer)
}