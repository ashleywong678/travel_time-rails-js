$(() => {
  myTours()
})

const myTours = () => {
  $('.my_profile').on('click', (event) => {
    event.preventDefault()
    alert("hello")
  })
}