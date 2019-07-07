$(() => {
  profile()
})

const profile = () => {
  $('.my_profile').on('click', (event) => {
    event.preventDefault()
    fetch(`/agencies/${current_user.id}.josn`)
      .then((resp) => resp.json())
      .then(data => {
        $('#info').html('')
        data
      })
  })
}
