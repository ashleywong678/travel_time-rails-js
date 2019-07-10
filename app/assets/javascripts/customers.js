$(() => {
  allCustomers()
})

const allCustomers = () => {
  $('.all_customers').on('click', (e) => {
    e.preventDefault()
    let stateObj = {route: "customers"}
    history.pushState("", "", "customers")
    fetch('/customers.json')
      .then(res => res.json())
      .then(customers => {
        $('.main').html('')
        console.log(customers)
        customers.forEach(customer => {
          let newCustomer = new Customer(customer)
          let customerHtml = newCustomer.formatIndex()
          $('.main').append(`http://localhost:3000/${customerHtml}`)
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

Customer.prototype.formatIndex = function(){
  let customerHtml = `
  <li>${this.last_name}, ${this.first_name}
  <a href='http://localhost:3000/customers/${this.id}'>See this customer</a>
  </li>
  `
  return customerHtml
}