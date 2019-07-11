$(() => {
  allCustomers()
})

const allCustomers = () => {
  $('.all_customers').on('click', (e) => {
    e.preventDefault()
    const data = 'http://localhost:3000/'
    url = data + "customers"
    history.pushState(null, null, url)
    fetch('/customers.json')
      .then(res => res.json())
      .then(customers => {
        $('.main').html('')
        $('.main').append('<h1 class="center">Customer Accounts</h1><br><ul class="left" id="info"></ul>')
        customers.forEach(customer => {
          let newCustomer = new Customer(customer)
          let customerHtml = newCustomer.formatIndex()
          $("#info").append(customerHtml)
        })
        $('.main').append('<br><br><a href="/customers/new" class="btn left">Create a Customer</a><br><br>')
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
  <li>
  <a href='http://localhost:3000/customers/${this.id}'>${this.first_name} ${this.last_name}</a>
  </li>
  `
  return customerHtml
}