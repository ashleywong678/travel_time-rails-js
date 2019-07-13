$(() => {
  allCustomers()
})

const allCustomers = () => {
  //show all customers from agency main page
  $('.all_customers').on('click', (e) => {
    e.preventDefault()
    const data = 'http://localhost:3000/'
    url = data + "customers"
    history.pushState(null, null, url)
    getCustomers()
  })
  //to show an individual customer page from rendered js index
  $(document).on('click', ".show_customer", function(e){
    e.preventDefault()
    let id = $(this).attr('data-id')
    fetch(`/customers/${id}.json`)
    .then(res => res.json())
    .then(customer => {
      $('.main').html('')
      let newCustomer = new Customer(customer)
        let customerHtml = newCustomer.formatShow()
        $(".main").append(customerHtml)
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
  <a href='http://localhost:3000/customers/${this.id}' class='show_customer' 
  data-id="${this.id}">${this.first_name} ${this.last_name}</a>
  </li>
  `
  return customerHtml
}

Customer.prototype.formatShow = function(){
  let customerHtml = `
  <h1 class="center">${this.first_name} ${this.last_name}</h1>
  `
  return customerHtml
}

const getCustomers = () => {
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
}