$(() => {
  myTours()
})

const myTours = () => {
  $('.my_tours').on('click', (e) => {
    e.preventDefault()
    let url = window.location.pathname.split('/')
    const agency_id = url[2]
    history.pushState(null, null, "tours")
    fetch(`/tours.json`)
      .then(res => res.json())
      .then(tours => {
        $('.main').html('')
        $('.main').append(`<h1 class="center">My Tours</h1><br><ul class="tour_list"></ul>`)
        $('.main').append('<a class="btn" href="/tours/new">Create a Tour</a>')
        tours.forEach(tour => {
          if(tour.agency.id === Number(agency_id)){
          let newTour = new Tour(tour)
            let tourHtml = newTour.formatIndex()
            $('.tour_list').append(tourHtml)
          }
        })
      })
  })
}

function Tour(tour){
  this.id = tour.id
  this.title = tour.title
  this.country = tour.country
  this.date = tour.date
  this.length = tour.length
  this.price =  tour.price
  this.description = tour.description
  this.agency = new Agency(tour.agency)
}

Tour.prototype.formatIndex = function(){
  let tourHtml = `
  <li><a href='/tours/${this.id}'>${this.title}</a>
  </li>
  `
  return tourHtml
}
