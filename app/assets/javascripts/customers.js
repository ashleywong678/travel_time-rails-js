$(() => {
  customersListeners()
})

const customersListeners = () => {
  //show all customers from agency main page
  $('.all_customers').on('click', (e) => {
    e.preventDefault()
    const data = 'http://localhost:3000/'
    let url = data + "customers"
    history.pushState(null, null, url)
    getCustomers()
  })
  //to show an individual customer page from rendered js index
  $(document).on('click', ".show_customer", function(e){
    e.preventDefault()
    let id = $(this).attr('data-id')
    let c_url = 'http://localhost:3000/customers/' + id
    history.pushState(null, null, c_url)
    fetch(`/customers/${id}.json`)
    .then(res => res.json())
    .then(customer => {
      $('.main').html('')
      let newCustomer = new Customer(customer)
      let customerHtml = newCustomer.formatShow()
      $(".main").append(customerHtml)
    })
  })
  //new customer form submission
  $("#new_customer").on('submit', function(e){
    e.preventDefault()
    const values = $(this).serialize()
    $.post("/customers", values)
      .done(function(data){
        $('.main').html('')
        const newCustomer = new Customer(data)
        history.pushState(null, null, `${newCustomer.id}`)
        const customerHtml = newCustomer.formatShow()
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
    <p><strong>Email: ${this.email}</strong></p>
    <p><strong>Phone number: ${this.phone_number}</strong></p>
    <p><strong>City: ${this.city}</strong></p>
    <p><strong>Country: ${this.country}</strong></p>
    <p><strong>Prefered Language: ${this.language}</strong></p>
    <br>
    <a href='${this.id}/edit' class='btn'>Edit this Customer</a>
    <a class="btn" rel="nofollow" data-method="delete" href="/customers/${this.id}">Delete Customer</a>
  `
  return customerHtml
}

const getCustomers = () => {
  fetch('/customers.json')
      .then(res => res.json())
      .then(customers => {
        $('.main').html('')
        $('.main').append('<h1 class="center">Customer Accounts</h1><br><ul id="info"></ul>')
        customers.forEach(customer => {
          let newCustomer = new Customer(customer)
          let customerHtml = newCustomer.formatIndex()
          $("#info").append(customerHtml)
        })
        $('.main').append('<br><br><a href="/customers/new" class="btn">Create a Customer</a>')
      })
}