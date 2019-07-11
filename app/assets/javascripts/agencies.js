$(() => {
  profile()
})

const profile = () => {
  $(document).on('click', '.my_profile', function(e){
    e.preventDefault()
    let url = this.document.URL
    fetch(`${url}.json`)
      .then(res => res.json())
      .then(agency => {
        console.log(agency)
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
  `
  return agencyHtml
}
