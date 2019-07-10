$(() => {
  myTours()
})

const myTours = () => {
  $('.my_tours').on('click', (e) => {
    e.preventDefault()
    history.pushState("", "", "tours")
    fetch('/tours.json')
      .then(res => res.json())
      .then(tours => {
        $('.main').html('')
        tours.forEach(tour => {
          let newTour = new Tour(tour)
          let tourHtml = newTour.formatIndex()
          $('.main').append(tourHtml)
        })
      })
  })
}

function Tour(tour){
  this.id = tour.id
  this.id = tour.title
  this.date = tour.date
  this.length = tour.length
  this.price =  tour.price
  this.country = tour.country
  this.description = tour.description
}

Tour.prototype.formatIndex = function(){
  let tourHtml = `
  <li><a href='/tour/${this.id}'>${this.title}</a>
  </li>
  `
  return tourHtml
}
