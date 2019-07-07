$(() => {
  myTours()
})

const myTours = () => {
  $('.my_tours').on('click', (event) => {
    event.preventDefault()
  })
}
