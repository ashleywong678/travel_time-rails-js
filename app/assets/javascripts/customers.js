$(() => {
  allCustomers()
})

const allCustomers = () => {
  $('.all_customers').on('click', (e) => {
    e.preventDefault()
    fetch('/customers.json')
      .then(res => res.json())
      .then(customers => {
        $('#info').html('')
        customers.forEach( customer => {
          let newCustomer = new Customer(customer)
          console.log(newCustomer)
        })
      })
  })
}

function Customer(customer){
  this.id = customer.id
  this.first_name = customer.first_name
  this.last_name = customer.last_name
  this.email = customer.email
  this.phone_number = customer.phone_number
  this.city = customer.city
  this.country = customer.country
  this.language = customer.language
}