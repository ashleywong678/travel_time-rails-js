$(() => {
  profile()
})

const profile = () => {
  $(document).on('click', '.my_profile', function(e){
    e.preventDefault()
    let id = window.location.pathname.split('/')[2]
    let url = 'http://localhost:3000/agencies/' + id
    history.pushState(null, null, url)
    console.log(id)
    fetch(`/agencies/${id}.json`)
      .then(res => res.json())
      .then(agency => {
        $('.main').html('')
        console.log(agency)
        let newAgency = new Agency(agency)
        let agencyHtml = newAgency.formatIndex()
        $(".main").append(agencyHtml)
        $(".main").append(`<br><a class="btn" href="/agencies/${id}/edit">Edit Profile</a>`)
      })
  })
}

function Agency(agency){
  this.id = agency.id
  this.name = agency.name
  this.country = agency.country
  this.email = agency.email
  this.address = agency.address
  this.language = agency.language
  this.phone_number = agency.phone_number
  this.tours = agency.tours
}

Agency.prototype.formatIndex = function(){
  let agencyHtml = `
  <h1 class="center">${this.name}</h1>
  <ul>
      <p><strong>Email: </strong> ${this.email}</p>
      <p><strong>Address:</strong> ${this.address}</p>
      <p><strong>Phone Number:</strong> ${this.phone_number}</p>
      <p><strong>Country:</strong> ${this.country}</p>
      <p><strong>Main Language:</strong> ${this.language}</p>
    </ul>
  `
  return agencyHtml
}
